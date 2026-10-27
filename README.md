# DỰ ÁN NÔNG NGHIỆP THÔNG MINH SMARTFARM 
## Hướng Dẫn Chạy Script
Để chạy tự động module báo cáo sự cố hệ thống, sử dụng lệnh PowerShell tại thư mục `scripts/`:
```powershell
powershell -ExecutionPolicy Bypass -File .\auto_report.ps1
```
## Checklist kiểm tra thiết bị
[x] Kiểm tra kết nối mạng và tín hiệu sóng tại các trạm cảm biến ngoài trời

[ ] Cấu hình lại ngưỡng cảnh báo mục do CRITICAL trên máy chủ trung tâm

[x] Sao lưu định kỳ dữ liệu log vào thư mục backup an toàn
## Bảng thông số phần cứng 
| Tên thiết bị | Đơn giá | Loại Storage| 
| :--- | :--- | :--- |
| Raspberry Pi 4 Model B | 1.450.000 | SSD |
| Intel NUC i3 | 6.200.000 | SSD |
| Orange Pi 5 | 2.300.000 | SSD |
| Dell Optiplex Micro | 5.400.000 | HDD |
| Mini PC Fanless N100 | 4.200.000 | SSD |
| Synology DS220j NAS | 3.900.000 | HDD |
---

# Mục Phân tích hệ thống: 
## Xác định Input – Process – Output của chức năng lọc log:
- Input: File nhật ký thô log-he-thong.log chứa các dòng log vận hành với nhiều mức độ khác nhau (INFO, WARNING, ERROR, CRITICAL).

- Process: Sử dụng PowerShell Script (auto_report.ps1) kết hợp pipeline (|), lệnh Get-Content, bộ lọc Select-String để trích xuất các dòng lỗi, đồng thời tính toán tổng số lượng sự cố ghi nhận.

- Output: Báo cáo tổng hợp sự cố văn bản lưu tại backup/bao-cao-su-co.txt gồm tiêu đề thời gian, danh sách chi tiết lỗi và tổng số lượng sự cố.

## Tầng DIKW :
- **Data**: “2026-10-12 08:15:01 [ERROR] sensor-03 Connection TIMEOUT after 30s”
- **Information**:“Hôm nay hệ thống ghi nhận 8 sự cố, trong đó 4 sự cố đến từ trạm sensor-03.”
- **Knowledge**: “Trạm sensor-03 hay mất kết nối vào buổi chiều do sóng yếu, nên cần lắp thêm anten."
- **Wisdom**: “Quyết định thay modem trạm sensor-03 trước thứ Sáu.”

