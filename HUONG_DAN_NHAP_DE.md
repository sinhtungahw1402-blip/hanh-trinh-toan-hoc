# 📖 HƯỚNG DẪN NHẬP NGÂN HÀNG CÂU HỎI TOÁN HỌC (THCS LỚP 6–9)

Tài liệu này hướng dẫn Quản trị viên và Giáo viên cách chuẩn bị file ngân hàng câu hỏi để đưa vào ứng dụng **"Hành trình Toán học"**.

---

## 📁 1. Hai định dạng file được hỗ trợ

Hệ thống hỗ trợ nhập liệu thông qua 2 loại file mẫu có sẵn trong thư mục ứng dụng:

| Định dạng file | Mục đích sử dụng | Phần mềm chỉnh sửa |
| :--- | :--- | :--- |
| **`mau-cau-hoi-toan.csv`** | Thích hợp cho giáo viên nhập nhanh câu trắc nghiệm (MCQ) và điền số (NUM) | **Microsoft Excel**, Google Trang tính |
| **`mau-cau-hoi-toan.json`** | Hỗ trợ đầy đủ tất cả các dạng câu phức tạp (ERR - tìm lỗi sai, ORDER - sắp xếp bước giải) | Notepad, VS Code, bất kỳ trình soạn thảo nào |

---

## 📊 2. Quy cách nhập file Excel / CSV (`mau-cau-hoi-toan.csv`)

Khi mở file `mau-cau-hoi-toan.csv` bằng Microsoft Excel, bạn sẽ thấy các cột tiêu đề sau:

| Tên cột | Ý nghĩa | Giá trị hợp lệ / Ví dụ |
| :--- | :--- | :--- |
| **`Khoi`** | Khối lớp | `6`, `7`, `8`, `9` |
| **`Ma_Bai`** | Mã bài học theo sách GK | Ví dụ: `L6-C1-B1`, `L8-C2-B6`, `L9-C1-B2` |
| **`Cap_Do`** | 4 thang cấp độ nhận thức | `1` (Nhận biết), `2` (Thông hiểu), `3` (Vận dụng), `4` (Vận dụng cao) |
| **`Dang_Cau`** | Mã dạng câu hỏi | `MCQ` (Trắc nghiệm), `NUM` (Điền số / Biểu thức) |
| **`De_Bai`** | Đề bài (có thể chứa công thức KaTeX) | Ví dụ: `Khai triển hằng đẳng thức $(x + 3)^2$:` |
| **`Dap_An_Dung`** | Đáp án chính xác | Ví dụ: `$x^2 + 6x + 9$` hoặc `16` |
| **`Dap_An_Nhieu_1`** | Phương án sai thứ nhất | Ví dụ: `$x^2 + 9$` |
| **`Giai_Thich_Loi_1`** | **Lời giải thích khi học sinh chọn trúng lỗi này** | Ví dụ: `Còn thiếu số hạng hai lần tích 2ab` |
| **`Dap_An_Nhieu_2`** | Phương án sai thứ hai | Ví dụ: `$x^2 + 3x + 9$` |
| **`Giai_Thich_Loi_2`** | Lời giải thích lỗi sai thứ 2 | Ví dụ: `Sai hệ số hạng tử chéo 2ab` |
| **`Dap_An_Nhieu_3`** | Phương án sai thứ ba | Ví dụ: `$x^2 + 6x + 3$` |
| **`Giai_Thich_Loi_3`** | Lời giải thích lỗi sai thứ 3 | Ví dụ: `Quên bình phương hằng số b^2` |
| **`Loi_Giai_Chi_Tiet`** | Hướng dẫn giải chi tiết từng bước | Ví dụ: `Áp dụng (a+b)^2 = a^2 + 2ab + b^2.` |
| **`Goi_Y`** | Gợi ý khi học sinh bấm nút trợ giúp | Ví dụ: `Nhớ số hạng ở giữa là 2ab` |
| **`Thoi_Gian_Giay`** | Thời gian làm câu hỏi (giây) | Mặc định: `30`, `35`, `45` |

> [!TIP]
> **Điểm đặc biệt của hệ thống:** Khi học sinh chọn vào phương án sai, hệ thống sẽ đọc cột `Giai_Thich_Loi` tương ứng để chỉ đúng lỗi tư duy cho học sinh (thay vì chỉ báo "Sai rồi"). Thầy cô nên ghi rõ nguyên nhân học sinh hay nhầm lẫn vào cột này.

---

## 📐 3. Cách viết công thức toán học (KaTeX)

Mọi công thức toán đều đặt trong cặp dấu **`$`** ở hai đầu:

- **Phân số:** `$\frac{a}{b}$` $\rightarrow$ hiển thị thành $\frac{a}{b}$ (Ví dụ: `$\frac{1}{2} + \frac{1}{3}$`)
- **Lũy thừa / Số mũ:** `$x^2$`, `$2^4$`, `$(a+b)^3$`
- **Căn bậc hai:** `$\sqrt{49}$`, `$\sqrt{x^2+1}$`
- **Dấu nhân / Dấu chia:** `$\times$`, `$\cdot$`, `$\div$`
- **Dấu so sánh:** `$\le$` ($\le$), `$\ge$` ($\ge$), `$\ne$` ($\ne$)
- **Hệ phương trình:** `$\begin{cases} x + y = 5 \\ 2x - y = 4 \end{cases}$`
- **Hình học:** `$\Delta ABC$`, `$\widehat{A} = 90^\circ$`

---

## 🧩 4. Cấu trúc cho các dạng câu hỏi đặc thù trong file JSON

### Dạng 1: `ERR` (Thám tử lỗi sai)
Học sinh chạm vào dòng bị biến đổi sai:
```json
{
  "grade": 8,
  "level": 3,
  "type": "ERR",
  "stem": "Thám tử lỗi sai: Tìm bước bị sai trong lời giải:",
  "steps": [
    { "num": 1, "text": "Dòng 1: Áp dụng $(a - b)^2 = a^2 - 2ab + b^2$" },
    { "num": 2, "text": "Dòng 2: Thay số: $x^2 - 2 \\times x \\times 4 - 4^2$" },
    { "num": 3, "text": "Dòng 3: Tính ra: $x^2 - 8x - 16$" }
  ],
  "wrong_step_num": 2,
  "explain": "Dòng 2 bị sai dấu ở số hạng cuối cùng: theo công thức phải là $+ 4^2 = +16$."
}
```

### Dạng 2: `ORDER` (Sắp xếp các bước giải)
Học sinh di chuyển các bước để xếp đúng thứ tự:
```json
{
  "grade": 7,
  "level": 2,
  "type": "ORDER",
  "stem": "Sắp xếp 4 bước sau để tìm x trong phương trình $x + 1/3 = 5/6$:",
  "items": [
    { "id": "s1", "text": "Chuyển vế: $x = 5/6 - 1/3$" },
    { "id": "s2", "text": "Quy đồng mẫu: $x = 5/6 - 2/6$" },
    { "id": "s3", "text": "Trừ tử số: $x = 3/6$" },
    { "id": "s4", "text": "Rút gọn tối giản: $x = 1/2$" }
  ],
  "correct_order": ["s1", "s2", "s3", "s4"]
}
```

---

## 🚀 5. Thao tác nạp đề trong ứng dụng

1. Đăng nhập vào quyền **Quản trị viên (Admin)** (nhấn nút `⚙️ Admin` ở góc trên bên phải).
2. Chuyển sang thẻ **`📚 Ngân Hàng Câu Hỏi`**.
3. Bấm vào nút màu xanh **`📥 Nhập File Đề (CSV / JSON)`**.
4. Bạn có thể:
   - **Tải file mẫu** về máy bằng nút `📄 Tải File Excel Mẫu` hoặc `📋 Tải File JSON Mẫu`.
   - Hoặc **kéo thả file đã soạn** vào ô tải lên.
   - Hoặc **dán trực tiếp nội dung CSV/JSON** vào ô văn bản.
5. Xem trước danh sách câu hỏi đã đọc được $\rightarrow$ Bấm **`✓ Xác nhận nạp vào ngân hàng đề`**.
6. Hệ thống sẽ tự động cập nhật ngay lập tức vào kho đề và lưu vào bộ nhớ.
