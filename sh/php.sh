#!/bin/bash

sudo pacman -Syu --noconfirm
sudo pacman -S php php-apache --noconfirm


#lalu masuk ke directory /etc/httpd/conf/
# atau lalu execute pakai vim or something
# like this sudo vim /etc/httpd/conf/httpd.conf
# ignore/berikan tag komentar pada 
# LoadModule mpm_event_module modules/mod_mpm_event.so 
# lalu aktifkan LoadModule mpm_prefork_module modules/mod_mpm_prefork.so
# setelah itu write dibagian paling bawah like this:
# LoadModule php_module modules/libphp.so
# AddHandler php-script .php
# Include conf/extra/php_module.conf

