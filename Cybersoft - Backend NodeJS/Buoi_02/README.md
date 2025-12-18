# I. Cài MySQL Bằng Docker
## 01. Create & Run MySQL Container
> docker run  
> -d  
> --name <u><b>Name</u></b>  
> -e MYSQL_ROOT_PASSWORD=<u><b>Pasword</u></b>  
> -e MYSQL_DATABASE=<u><b>DB Name</u></b>  
> -p <u><b>Host Port</u></b>:<u><b>Container Port</u></b>  
> -v <u><b>Volumn Name</u></b>:<u><b>Container Path</u></b>  
> mysql:<u><b>Phiên Bản MySQL</u></b>
***
| Thành phần     | Cú pháp                                                          | Ý nghĩa                                 | Ghi chú thực tế                         |
|----------------|------------------------------------------------------------------|-----------------------------------------|-----------------------------------------|
| Lệnh Chính     | `docker run`                                                     | Tạo Và Chạy Container Mới               | Image Chưa Có Sẽ Tự Pull                |
| Chạy Nền       | `-d`                                                             | Detached Mode                           | Không Chiếm Terminal                    |
| Tên Container  | `--name`<u><b>`Name`</u></b>                                     | Đặt Tên Container                       | Dùng Để `stop` / `rm` / `logs`          |
| Env Var (root) | `-e MYSQL_ROOT_PASSWORD =`<u><b>`Pasword`</u></b>                | Mật Khẩu User `root`                    | Bắt Buộc Với MySQL Image                |
| Env Var (db)   | `-e MYSQL_DATABASE=`<u><b>`DB Name`</u></b>                      | Tạo DB Mặc Định Khi Start               | Tiện Cho App Node.js                    |
| Map Port       | `-p`<u><b>`Host Port`</u></b>`:`<u><b>`Container Port`</u></b>   | Host 3306 → Container 3306              | App Connect `localhost:3306`            |
| Volume         | `-v`<u><b>`Volumn Name`</u></b>`:`<u><b>`Container Path`</u></b> | Lưu Data Ra Ngoài Container             | Xóa Container Không Mất Data            |
| Image          | `mysql:`<u><b>`Phiên Bản MySQL`</u></b>                          | Image MySQL version 8.0                 | Nên Pin Version, Tránh `latest`         |
```bash
Ví Dụ:
docker run -d --name learn_nodejs -e MYSQL_ROOT_PASSWORD=16121409 -e MYSQL_DATABASE=nodejs_db -p 3306:3306 -v mysql_data:/var/lib/mysql mysql:8.0
```
## 02. Xác Minh Container Đang Chạy
```bash
docker ps
```
***
| CONTAINER ID  | IMAGE     | COMMAND               | CREATED     | STATUS          | PORTS                                | NAMES             |
|:-------------:|:---------:|:---------------------:|:-----------:|:---------------:|:------------------------------------:|:-----------------:|
| 77613d1fd9e3  | mysql:8.0 | "docker-entrypoint.s…"| 6 hours ago | Up 5 seconds    | 0.0.0.0:3306->3306/tcp, 33060/tcp    | learn_nodejs      |
## 03. Tương Tác Với Container Đang Chạy
```bash
docker exec -it learn_nodejs bash
```
***



## 04. Kết Nối Với Máy Chủ CSDL MySQL
## 05. Tạo CSDL trong MySQL
## 06. Xác Nhận Việc Tạo CSDL
## 07. Kết Nối Với CSDL
## 08. Tạo Một Bảng Trong CSDL
## 09. Chèn Bản Ghi Vào Bảng MySQL
## 10. Lấy Dữ Liệu Từ Bảng