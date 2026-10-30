# 🎮 HÀNH TRÌNH TOÁN HỌC – GAME TOÁN THCS (LỚP 6–9)

Ứng dụng trò chơi giáo dục toán học toàn diện dành cho học sinh Trung học Cơ sở (Khối 6, 7, 8, 9) bám sát bộ sách giáo khoa **Kết nối tri thức với cuộc sống**, tích hợp **Cổng Quản trị viên (Admin Portal)** theo dõi hoạt động học tập thời gian thực, bảng xếp hạng, và phân tích các lỗi sai phổ biến.

---

## 🌟 ĐẶC ĐIỂM NỔI BẬT

### 1. Dành cho Học sinh (Giao diện Mobile-First & Web)
- **4 Vương quốc Toán học tương ứng 4 Khối lớp:**
  - 🌲 **Lớp 6 – Vương quốc Rừng Xanh**: Khu rừng Số học & Hình học kỳ bí (Tập hợp, Số nguyên, Phân số, Hình phẳng).
  - 🌊 **Lớp 7 – Vương quốc Đại Dương**: Biển cả Số hữu tỉ, Số thực & Tam giác bằng nhau.
  - 🏙️ **Lớp 8 – Vương quốc Công Nghệ**: Thành phố Đa thức, Hằng đẳng thức đáng nhớ & Định lí Pythagore.
  - 🚀 **Lớp 9 – Vương quốc Vũ Trụ**: Chinh phục Hệ phương trình, Căn thức bậc hai & Phương trình bậc hai.
- **Bản đồ bài học dạng đường mòn (Candy Crush / Duolingo):** Mỗi chương kết thúc bằng một màn **Đại chiến Boss** hoành tráng có thanh máu (HP) và hiệu ứng tấn công.
- **4 Cấp độ chuẩn hoá cho mỗi bài:**
  - **Cấp 1: Nhận biết** (10 câu, tính 1 bước, mở sẵn)
  - **Cấp 2: Thông hiểu** (10 câu, tính 2–3 bước, yêu cầu $\ge 1$ sao Cấp 1)
  - **Cấp 3: Vận dụng** (3 câu, tìm lỗi sai, nhiều bước, yêu cầu $\ge 2$ sao Cấp 2)
  - **Cấp 4: Vận dụng cao** (2 câu, bài thực tế, bài mẹo)
- **Đa dạng thể loại mini-game:**
  - ⚡ *Tính nhanh*: Đồng hồ đếm ngược, chuỗi đúng combo tăng điểm số theo công thức chuẩn.
  - 🔍 *Thám tử lỗi sai*: Bấm trực tiếp vào bước giải sai của bạn học để tìm lỗi tư duy.
  - 🔀 *Sắp xếp lời giải*: Kéo hoặc dịch chuyển các bước giải phương trình về đúng trình tự.
  - ⚔️ *Đại chiến Boss*: Rút cạn thanh máu Boss cuối chương khi trả lời chính xác.
  - ⌨️ *Bàn phím toán chuyên dụng (Math Keypad)*: Hỗ trợ gõ phân số, số âm, số mũ, căn bậc hai cả trên điện thoại lẫn máy tính.
- **Công thức tính điểm chuẩn (Mục 9 Tài liệu thiết kế):**
  $$D = C \times (1 + 0{,}3\,t) \times (1 + 0{,}05\,k) \times (1 - 0{,}25\,g)$$
  *(Trong đó: $C$ là điểm cơ bản, $t$ là phần thời gian còn lại, $k$ là chuỗi đúng liên tiếp, $g$ là số gợi ý đã dùng).*
- **Ôn tập thông minh (Spaced Repetition) & Thử thách ngày:** Tự động lưu các câu làm sai và nhắc lại sau 1, 3, 7 ngày.
- **Hiệu ứng âm thanh sống động (Web Audio API):** Tự tổng hợp âm thanh (Chime đúng, Combo fanfare, Buzzer sai, Hit Boss, Victory), không cần tải file MP3 ngoài.

---

### 2. Dành cho Quản trị viên (Admin Portal)
- **Theo dõi thời gian thực (Live Activity Feed):**
  - Xem ngay lập tức học sinh nào vừa làm bài gì, điểm số, số sao, độ chính xác (%) và thời gian làm bài.
- **Hồ sơ học sinh & Giám sát gian lận (Anti-Cheat):**
  - Danh sách toàn bộ học sinh tham gia với cấp độ, tổng XP, chuỗi ngày và tỷ lệ chính xác.
  - Tự động phát hiện và gắn cờ cảnh báo (Flag) những trường hợp bất thường (ví dụ: làm 10 câu trong 4 giây đạt 100%).
  - Quyền Admin: Reset điểm về 0, khóa tài khoản vi phạm.
- **Biểu đồ nhiệt lỗi sai (Error Heatmap):**
  - Thống kê chi tiết những chỗ học sinh hay mắc lỗi nhất (ví dụ: *quên $2ab$ trong hằng đẳng thức*, *cộng phân số quên quy đồng*, *nhân số âm sai dấu*).
- **Quản lý ngân hàng câu hỏi:**
  - Xem trước hiển thị công thức toán học KaTeX.
  - Biểu mẫu thêm câu hỏi mới trực tiếp với mã lỗi và lời giải chi tiết.
- **Xuất dữ liệu dự phòng (JSON Export):** Lưu trữ toàn bộ dữ liệu học sinh, kết quả và câu hỏi chỉ với 1 click.

---

## 🚀 HƯỚNG DẪN CHẠY VÀ SỬ DỤNG

### Cách 1: Chạy trên Máy tính (Mở trực tiếp)
1. Truy cập thư mục:
   `C:\Users\TUNG\.gemini\antigravity\scratch\hanh-trinh-toan-hoc`
2. Nhấp đúp chuột vào file `index.html` để mở trong bất kỳ trình duyệt nào (CocCoc, Chrome, Edge, Brave,...).
3. Ứng dụng hoạt động đầy đủ 100%, có sẵn dữ liệu học sinh và câu hỏi mẫu.

### Cách 2: Mở trên Điện thoại (Thông qua Wi-Fi máy tính)
1. Mở PowerShell trong thư mục này và chạy lệnh:
   ```powershell
   .\server.ps1
   ```
2. Màn hình sẽ hiển thị địa chỉ IP nội bộ, ví dụ:
   `http://192.168.1.15:8080`
3. Trên điện thoại (kết nối cùng Wi-Fi với máy tính), mở trình duyệt Safari (iOS) hoặc Chrome (Android) và nhập địa chỉ đó.
4. **Cài đặt như App (PWA):**
   - Trên iOS: Bấm nút **Chia sẻ** (Share) -> Chọn **"Thêm vào Màn hình chính"** (Add to Home Screen).
   - Trên Android: Bấm menu 3 chấm -> Chọn **"Cài đặt ứng dụng"** hoặc **"Thêm vào Màn hình chính"**.

---

## 🔑 CHUYỂN ĐỔI GIỮA HỌC SINH VÀ QUẢN TRỊ VIÊN

- Ở góc trên bên phải của màn hình luôn có nút **"⚙️ Admin"** hoặc **"🎓 Chuyển sang Học sinh"**.
- Quản trị viên chỉ cần bấm nút này để chuyển đổi tức thì giữa chế độ người chơi (để trải nghiệm) và chế độ quản trị (để giám sát lớp học).
- Dữ liệu hoàn thành bài và điểm số của học sinh khi làm bài sẽ lập tức xuất hiện trên bảng **Nhật ký hoạt động** của Admin.

---

## 📁 CẤU TRÚC MÃ NGUỒN

```
hanh-trinh-toan-hoc/
├── index.html          # Khung trang chính SPA & điều hướng
├── manifest.json       # Cấu hình PWA để cài app lên điện thoại
├── sw.js               # Service Worker hỗ trợ offline
├── server.ps1          # Máy chủ web tích hợp sẵn chạy bằng PowerShell
├── README.md           # Hướng dẫn chi tiết
├── css/
│   └── app.css         # Hệ thống giao diện responsive, màu sắc theo khối lớp
└── js/
    ├── data.js         # Dữ liệu 4 khối lớp, ngân hàng câu hỏi, học sinh mẫu & lỗi sai
    ├── audio.js        # Bộ tổng hợp âm thanh game (Web Audio API)
    ├── mathKeypad.js   # Bàn phím toán học cảm ứng cho NUM / EXPR
    └── app.js          # Logic trò chơi, tính điểm, timer, phân tích lỗi & Admin
```
