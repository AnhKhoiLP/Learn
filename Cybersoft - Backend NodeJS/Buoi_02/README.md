# Cài MySQL bằng Docker

## Create & Run MySQL Container

```bash
docker run -d
	--name mysql_learn
	-e MYSQL_ROOT_PASSWORD=secret123
	-e MYSQL_DATABASE=learn_db
	-p 3306:3306
	-v mysql_data:/var/lib/mysql
	mysql:8.0
```

| Thành phần     | Cú pháp                                 | Ý nghĩa                                 | Ghi chú thực tế                         |
|----------------|-----------------------------------------|-----------------------------------------|-----------------------------------------|
| Lệnh Chính     | `docker run`                            | Tạo Và Chạy Container Mới               | Image Chưa Có Sẽ Tự Pull                |
| Chạy Nền       | `-d`                                    | Detached Mode                           | Không Chiếm Terminal                    |
| Tên Container  | `--name mysql_learn`                    | Đặt Tên Container                       | Dùng Để `stop` / `rm` / `logs`          |
| Env Var (root) | `-e MYSQL_ROOT_PASSWORD=secret123`      | Mật Khẩu User `root`                    | Bắt Buộc Với MySQL Image                |
| Env Var (db)   | `-e MYSQL_DATABASE=learn_db`            | Tạo DB Mặc Định Khi Start               | Tiện Cho App Node.js                    |
| Map Port       | `-p 3306:3306`                          | Host 3306 → Container 3306              | App Connect `localhost:3306`            |
| Volume         | `-v mysql_data:/var/lib/mysql`          | Lưu Data Ra Ngoài Container             | Xóa Container Không Mất Data            |
| Image          | `mysql:8.0`                             | Image MySQL version 8.0                 | Nên Pin Version, Tránh `latest`         |

--# Xác minh container đang chạy
--# Tương tác với container đang chạy
--# Kết nối với máy chủ cơ sở dữ liệu PostgreSQL
--# Tạo cơ sở dữ liệu trong PostgreSQL
--# Xác nhận việc tạo cơ sở dữ liệu
--# Kết nối với cơ sở dữ liệu
--# Tạo một bảng trong cơ sở dữ liệu
--# Chèn bản ghi vào bảng PostgreSQL
--# Lấy dữ liệu từ bảng