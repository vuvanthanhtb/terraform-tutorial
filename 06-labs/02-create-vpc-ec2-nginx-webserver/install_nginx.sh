#!/bin/bash
echo "📦 Cài đặt Nginx từ Amazon Linux Extras..."
amazon-linux-extras enable nginx1 -y
yum install -y nginx

echo "🚀 Khởi động và bật Nginx..."
systemctl start nginx
systemctl enable nginx

echo "📁 Tạo thư mục cho trang web demo..."
mkdir -p /usr/share/nginx/demo

echo "🌐 Tạo nội dung HTML cho trang web demo..."
cat > /usr/share/nginx/demo/index.html <<'EOF'
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Demo Nginx</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            color: #333;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        .container {
            background-color: #ffffffcc;
            padding: 40px 60px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: #2c3e50;
        }

        p {
            font-size: 1.2rem;
            color: #555;
        }

        footer {
            margin-top: 30px;
            font-size: 0.9rem;
            color: #777;
        }

        a {
            color: #2980b9;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🎉 Chào mừng đến với Nginx!</h1>
        <p>Đây là một trang web mẫu đang chạy trên máy chủ Nginx (Amazon Linux 2).</p>
        <footer>
            Được tạo bởi <a href="#">bạn</a> - Với ❤️ từ Shell Script
        </footer>
    </div>
</body>
</html>
EOF

echo "🔐 Phân quyền cho thư mục demo..."
chown -R nginx:nginx /usr/share/nginx/demo

echo "⚙️ Tạo cấu hình server block..."
cat > /etc/nginx/conf.d/demo.conf <<EOF
server {
    listen       80;
    server_name  localhost;

    root   /usr/share/nginx/demo;
    index  index.html;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOF

echo "🧹 Xóa cấu hình mặc định nếu cần..."
rm -f /etc/nginx/conf.d/default.conf

echo "✅ Kiểm tra cấu hình Nginx..."
nginx -t

echo "🔄 Khởi động lại Nginx..."
systemctl restart nginx
