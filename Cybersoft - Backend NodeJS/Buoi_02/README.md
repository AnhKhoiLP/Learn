# Cài MySQL Bằng Docker
## 01. Create & Run MySQL Container
```bash
docker run -d --name learn_nodejs -e MYSQL_ROOT_PASSWORD=16121409 -e MYSQL_DATABASE=nodejs_db -p 3306:3306 -v mysql_data:/var/lib/mysql mysql:8.0
```
| Thành phần     | Cú pháp                                 | Ý nghĩa                                 | Ghi chú thực tế                         |
|----------------|-----------------------------------------|-----------------------------------------|-----------------------------------------|
| Lệnh Chính     | `docker run`                            | Tạo Và Chạy Container Mới               | Image Chưa Có Sẽ Tự Pull                |
| Chạy Nền       | `-d`                                    | Detached Mode                           | Không Chiếm Terminal                    |
| Tên Container  | `--name learn_nodejs`                   | Đặt Tên Container                       | Dùng Để `stop` / `rm` / `logs`          |
| Env Var (root) | `-e MYSQL_ROOT_PASSWORD = 16121409`     | Mật Khẩu User `root`                    | Bắt Buộc Với MySQL Image                |
| Env Var (db)   | `-e MYSQL_DATABASE = nodejs_db`         | Tạo DB Mặc Định Khi Start               | Tiện Cho App Node.js                    |
| Map Port       | `-p 3306:3306`                          | Host 3306 → Container 3306              | App Connect `localhost:3306`            |
| Volume         | `-v mysql_data:/var/lib/mysql`          | Lưu Data Ra Ngoài Container             | Xóa Container Không Mất Data            |
| Image          | `mysql:8.0`                             | Image MySQL version 8.0                 | Nên Pin Version, Tránh `latest`         |
## 02. Xác Minh Container Đang Chạy
```bash
docker ps
```
| CONTAINER ID  | IMAGE     | COMMAND               | CREATED     | STATUS          | PORTS                                | NAMES             |
|---------------|-----------|-----------------------|-------------|-----------------|--------------------------------------|-------------------|
| 77613d1fd9e3  | mysql:8.0 | "docker-entrypoint.s…"| 6 hours ago | Up 5 seconds    | 0.0.0.0:3306->3306/tcp, 33060/tcp    | learn_nodejs      |
## 03. Tương Tác Với Container Đang Chạy
```bash
docker exec -it learn_nodejs bash
```



## Kết nối với máy chủ cơ sở dữ liệu PostgreSQL
## Tạo cơ sở dữ liệu trong PostgreSQL
## Xác nhận việc tạo cơ sở dữ liệu
## Kết nối với cơ sở dữ liệu
## Tạo một bảng trong cơ sở dữ liệu
## Chèn bản ghi vào bảng PostgreSQL
## Lấy dữ liệu từ bảng