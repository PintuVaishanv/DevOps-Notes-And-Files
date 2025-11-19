sudo apt -update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

echo "<h1>Bhaiii here is the ngnix working in the new instance</h1>" > /var/www/html/index.html