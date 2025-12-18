--> Cài Postgres Trong Docker
	--# Create And Run Postgres Container
		--| docker run --name db_postgres -e POSTGRES_PASSWORD=1234 -d -p 5432:5432 postgres 
			--+ --name postgresCont							: Đặt tên cho container là postgresCont.
			--+ -e POSTGRES_PASSWORD=1234				: Thiết lập mật khẩu cho user postgres là pass123.
			--+ -d															: Chạy container ở chế độ nền (background).
			--+ -p 5432:5432										: Ánh xạ cổng 5432 của container với cổng 5432 trên máy host, giúp truy cập PostgreSQL từ bên ngoài.
			--+ postgres												: Sử dụng hình ảnh (image) chính thức của PostgreSQL từ Docker Hub.
		--| Upon doing so, the Postgres container has been created and started.
	--# Xác minh container đang chạy
		--| Để kiểm tra xem container PostgreSQL có đang chạy hay không, bạn có thể sử dụng lệnh sau:
		--| docker ps
		--| Lệnh này sẽ hiển thị danh sách các container đang chạy. Nếu container postgresCont đang hoạt động, bạn sẽ thấy một dòng thông tin như sau:
		--| CONTAINER ID   IMAGE      COMMAND                  CREATED        STATUS        PORTS                    NAMES
		--| abc123456789   postgres   "docker-entrypoint.s…"   5 minutes ago  Up 5 minutes  0.0.0.0:5432->5432/tcp   postgresCont
	--# Tương tác với container đang chạy
		--| Nhập lệnh sau để mở terminal (shell) bên trong container PostgreSQL đang chạy:
		--| docker exec -it postgresCont bash
			--+ docker exec			: Thực thi lệnh trong container đang chạy.
			--+ -it							: Cho phép tương tác với terminal của container.
			--+ postgresCont		: Tên của container cần truy cập.
			--+ bash						: Mở shell Bash bên trong container.
			--$ root@dd7ac6ab8c39:/#
	--# Kết nối với máy chủ cơ sở dữ liệu PostgreSQL
		--| Thực hiện lệnh sau để kết nối với máy chủ cơ sở dữ liệu PostgreSQL:
		--| psql -h localhost -U postgres
			--+ psql: Công cụ dòng lệnh để làm việc với PostgreSQL.
			--+ -h localhost: Chỉ định máy chủ (host) là localhost (do container PostgreSQL đang chạy trên máy cục bộ).
			--+ -U postgres: Đăng nhập với tài khoản người dùng postgres.
		--| Sau khi thực thi lệnh trên, bạn sẽ vào SQL Shell, nơi bạn có thể chạy các câu lệnh SQL và các lệnh của psql.
			--$ postgres=#
	--# Tạo cơ sở dữ liệu trong PostgreSQL
		--| Sau khi đã kết nối thành công với PostgreSQL bằng psql, bạn có thể tạo một cơ sở dữ liệu mới bằng lệnh sau:
		--| CREATE DATABASE beamin [NHỚ DẤU ';']
	--# Xác nhận việc tạo cơ sở dữ liệu
		--| Để hiển thị danh sách tất cả các cơ sở dữ liệu và kiểm tra xem cơ sở dữ liệu mới đã được tạo hay chưa, chạy lệnh sau trong psql:
		--| \l
		--| Lệnh này sẽ liệt kê tất cả các cơ sở dữ liệu trong PostgreSQL.
		--| Nếu cơ sở dữ liệu beamin xuất hiện trong danh sách, điều đó có nghĩa là nó đã được tạo thành công.
			--$ 																										List of databases
			--$ 	Name    |  Owner   | Encoding | Locale Provider |  Collate   |   Ctype    | Locale | ICU Rules |   Access privileges   
			--$ ----------+----------+----------+-----------------+------------+------------+--------+-----------+-----------------------
			--$ beamin    | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |        |           |                       
			--$ postgres  | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |        |           |                       
			--$ template0 | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |        |           | =c/postgres          +
			--$ 					|          |          |                 |            |            |        |           | postgres=CTc/postgres 
			--$ template1 | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |        |           | =c/postgres          +
			--$ 					|          |          |                 |            |            |        |           | postgres=CTc/postgres 
	--# Kết nối với cơ sở dữ liệu
		--| Để kết nối với một cơ sở dữ liệu cụ thể trong PostgreSQL, sử dụng lệnh \c theo sau là tên cơ sở dữ liệu mà bạn muốn kết nối. Ví dụ, để kết nối với cơ sở dữ liệu tsl_employee, bạn sử dụng lệnh sau:
		--| \c beamin
		--| Sau khi chạy lệnh này, bạn sẽ kết nối thành công với cơ sở dữ liệu tsl_employee.
		--| Khi kết nối thành công, PostgreSQL sẽ hiển thị một thông báo như sau:
			--$ You are now connected to database "beamin" as user "postgres".
	--# Tạo một bảng trong cơ sở dữ liệu
		--| Để tạo một bảng mới trong cơ sở dữ liệu đã chọn, bạn sử dụng lệnh sau:\
		--| CREATE TABLE test_database(ID INT PRIMARY KEY NOT NULL, NAME TEXT NOT NULL) [NHỚ DẤU ';']
			--$ CREATE TABLE
	--# Chèn bản ghi vào bảng PostgreSQL
		--| Để chèn bản ghi mới vào bảng, sử dụng lệnh:
		--| INSERT INTO test_database VALUES(1, 'KHÔI') [NHỚ DẤU ';']
			--$ INSERT 0 1
	--# Lấy dữ liệu từ bảng
		--| Để xem dữ liệu trong bảng, bạn sử dụng lệnh sau:
		--| SELECT * FROM test_database [NHỚ DẤU ';']
			--$  id | name 
			--$ ----+------
			--$   1 | KHÔI 
--> Tạo Database
	CREATE SCHEMA db_beamin; GO
--> Tạo Table db_beamin.users
	CREATE TABLE db_beamin.users
	(
		users_id 						SERIAL 								PRIMARY KEY	,
		users_name 					VARCHAR(100) 					NOT NULL		,
		users_email 				VARCHAR(100) 	UNIQUE 	NOT NULL		,
		users_password 			VARCHAR(255) 					NOT NULL		,
		users_phone 				VARCHAR(15)												,
		users_address 			TEXT															,
		users_data_entry 		TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	);
	GO