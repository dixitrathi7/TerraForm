#!/bin/bash

# Update package list and install Nginx
yum update -y
yum install -y nginx

# Create a simple HTML file
bash -c 'cat <<EOF > /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Nginx!</title>
</head>
<body>
    <h1>Hello, World!</h1>
    <p>This is a simple HTML page hosted on Nginx.</p>
</body>
</html>
EOF'

# Start Nginx service
systemctl start nginx

# Enable Nginx to start on boot
systemctl enable nginx

echo "Nginx installed and HTML page hosted successfully!"