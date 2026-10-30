# Máy chủ Web cục bộ cho "Hành trình Toán học"
# Chạy trực tiếp bằng PowerShell có sẵn trong Windows (không cần cài thêm gì)
param([int]$port = 8080)

$folder = $PSScriptRoot

# Lấy địa chỉ IP mạng nội bộ (Wi-Fi hoặc LAN)
$localIP = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object { 
    $_.InterfaceAlias -notlike "*Loopback*" -and $_.IPAddress -notlike "169.254*" 
} | Select-Object -ExpandProperty IPAddress | Select-Object -First 1)

if (-not $localIP) { $localIP = "localhost" }

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://*:$port/")

try {
    $listener.Start()
} catch {
    $listener = New-Object System.Net.HttpListener
    $listener.Prefixes.Add("http://localhost:$port/")
    $listener.Start()
}

Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host "   🎮 HÀNH TRÌNH TOÁN HỌC - MÁY CHỦ WEB ĐANG CHẠY! 🎮" -ForegroundColor Green
Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host " 1. Trên Máy Tính (Admin & Chơi thử):" -ForegroundColor Yellow
Write-Host "    👉 http://localhost:$port" -ForegroundColor White
Write-Host ""
Write-Host " 2. Trên Điện Thoại (Cùng mạng Wi-Fi với máy tính này):" -ForegroundColor Yellow
Write-Host "    👉 http://${localIP}:$port" -ForegroundColor Green
Write-Host "    (Mở trình duyệt Safari/Chrome trên điện thoại và nhập địa chỉ trên)" -ForegroundColor DarkGray
Write-Host ""
Write-Host " 3. Tài khoản Quản trị viên (Admin):" -ForegroundColor Magenta
Write-Host "    Tên đăng nhập: admin   | Mật khẩu: admin123" -ForegroundColor White
Write-Host "    (Hoặc nhấn nút 'Chuyển sang Quản trị viên' ngay trên giao diện)" -ForegroundColor DarkGray
Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host " Nhấn Ctrl + C để dừng máy chủ." -ForegroundColor DarkYellow
Write-Host "=================================================================" -ForegroundColor Cyan

# Tự động mở trình duyệt
Start-Process "http://localhost:$port"

$mimeTypes = @{
    ".html" = "text/html; charset=utf-8"
    ".css"  = "text/css; charset=utf-8"
    ".js"   = "application/javascript; charset=utf-8"
    ".json" = "application/json; charset=utf-8"
    ".svg"  = "image/svg+xml"
    ".png"  = "image/png"
    ".ico"  = "image/x-icon"
}

while ($listener.IsListening) {
    try {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $urlPath = $request.Url.LocalPath.TrimStart('/')
        if ([string]::IsNullOrEmpty($urlPath)) {
            $urlPath = "index.html"
        }

        # Tránh directory traversal
        $filePath = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($folder, $urlPath))
        if (-not $filePath.StartsWith($folder)) {
            $response.StatusCode = 403
            $response.Close()
            continue
        }

        if (Test-Path $filePath -PathType Leaf) {
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
            $mime = if ($mimeTypes.ContainsKey($ext)) { $mimeTypes[$ext] } else { "application/octet-stream" }
            $response.ContentType = $mime
            
            # CORS headers cho phép truy cập điện thoại / web
            $response.AddHeader("Access-Control-Allow-Origin", "*")
            $response.AddHeader("Cache-Control", "no-cache, no-store, must-revalidate")

            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            $response.ContentLength64 = $bytes.Length
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
            $response.StatusCode = 200
        } else {
            $response.StatusCode = 404
            $notFoundBytes = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found: $urlPath")
            $response.OutputStream.Write($notFoundBytes, 0, $notFoundBytes.Length)
        }
        $response.Close()
    } catch {
        # Bỏ qua lỗi ngắt kết nối
    }
}
