# FRANKEN PHP LARAVEL CONTAINER - HARD CORE VERSION

1. Grab the Dockerfile by clone this entire repository or just copy the raw code.
2. Build the image using `docker build -t image-name . `. Replace image-name with your desire name for the image.
3. This image offer 4 expessed ports: 22 for ssh, 80 for phpmyadmin, 443 for https, and 8000 for laravel app.
4. Create container using this similar code <br> `docker run -d --name somename -p 10022:22 -p 10080:80 -p 10443:443 -p 10800:8000 -v .\laravel-app:/var/www/project image-name .` <br> Replace somename to your desired name, and adjust the ports to your favourite port number. Replace \laravel-app folder name into your real laravel project folder name.
5. Get into the container:<br> `docker exec -it somename bash`
6. Activate ssh and mariadb server.<br>`/etc/init.d/ssh start && /etc/init.d/mariadb start`. <br>The default root password is _assalamualaikum_. You can change it too.
7. Install and activate frankenphp:<br>`composer require laravel/octane && php artisan octane:install && php artisan octane:start &`
8. Wait a moment, and then you can exit from container, and try open the browser at http://localhost:10800/
