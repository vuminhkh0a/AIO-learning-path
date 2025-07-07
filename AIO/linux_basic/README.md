## Hướng dẫn cài đặt cho buổi học Unix/Linux for Data Science
### 1. File `setup_script.sh` – Tạo dữ liệu thực hành cho buổi học

Đây là một **script shell tự động** dùng để tạo bộ dữ liệu và thư mục mẫu cho việc thực hành trên lớp

Chạy file này bằng lệnh:

```bash
bash setup_script.sh
```

nó sẽ tự động:

#### Tạo cấu trúc thư mục như sau:

```
unix_data_science_practice/
├── config/
├── data/
│   ├── external/
│   ├── processed/
│   └── raw/
├── logs/
├── reports/
└── scripts/
```

#### Sinh dữ liệu mẫu:

* `data/raw/customers.csv`: danh sách khách hàng
* `data/raw/sales_transactions.csv`: giao dịch bán hàng
* `logs/website_access.log`: log truy cập website (giống log của Apache/nginx)
* `logs/application.log`: log ứng dụng
* `data/external/api_responses.json`: dữ liệu từ API mô phỏng
* `data/external/weather_data.json`: dữ liệu thời tiết
* `logs/model_training.log`: log huấn luyện mô hình học máy
* `config/*.conf` và `*.ini`: các file cấu hình
* `scripts/data_summary.sh`: script tóm tắt số liệu

#### Mục tiêu:

Tạo môi trường dữ liệu mô phỏng thực tế để luyện tập các lệnh:

* `grep`, `awk`, `cut`, `sort`, `uniq`, `wc`, `tail`,...
* xử lý file CSV, JSON, log,...
* tổ chức và quản lý dữ liệu trong thư mục

### 2. File `cheat_sheet.md` – Tài liệu tổng hợp lệnh

Đây là một **cheatsheet** tổng hợp các lệnh thường dùng trong Unix/Linux, đặc biệt phục vụ cho lĩnh vực Data Science.

#### Nội dung chính có thể bao gồm:

* Lệnh xử lý file CSV và văn bản
* Tìm kiếm và lọc dữ liệu với `grep`, `awk`
* Quản lý tệp, thư mục
* Xử lý log và tóm tắt dữ liệu
* Thao tác với dữ liệu JSON
* Pipeline (`|`), redirect (`>`, `>>`), biến môi trường,…

#### Mục đích:

* Làm tài liệu tham khảo nhanh khi thực hành
* Tăng hiệu suất thao tác dòng lệnh
* Phục vụ cho việc học, ôn thi, hoặc làm dự án

### Cách bắt đầu nhanh:

```bash
# Bước 1: Chạy script để tạo dữ liệu
bash setup_script.sh

# Bước 2: Xem qua cheat sheet
cat cheat_sheet.md

# Bước 3: Thực hành các lệnh dựa trên dữ liệu đã tạo
cd unix_data_science_practice
./scripts/data_summary.sh
```
