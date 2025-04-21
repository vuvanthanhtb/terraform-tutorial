#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo service httpd start
sudo systemctl enable httpd
echo "<h1>AWS Infra created using Terraform is us-east-1 Region</h1>" > /var/www/html/index.html
