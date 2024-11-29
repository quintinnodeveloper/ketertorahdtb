#!/data/data/com.termux/files/usr/bin/bash

# Atualizar pacotes e repositórios
pkg update && pkg upgrade -y

# Instalar o MariaDB (MySQL)
pkg install mariadb -y

# Inicializar o banco de dados
mysqld --user=mysql &

# Configurar o banco de dados
mysql_install_db

mariadb -u root -p

ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';

mariadb -u root -p root

# Informações sobre como acessar o MySQL
echo "Para acessar o banco de dados, use: mysql -u root"

# Configurar acesso remoto
nano /data/data/com.termux/files/usr/etc/my.cnf
De "bind-address = 127.0.0.1" para "bind-address = 0.0.0.0"

mariadb -u root -p

> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;

> FLUSH PRIVILEGES;

killall mysqld

mariadbd --user=mysql &

# Criar novo banco de dados e novo ususario

mariadb -u root -p

CREATE DATABASE db_keter;

CREATE USER 'desenvolvimento'@'%' IDENTIFIED BY 'desenvolvimento';
# SHOW GRANTS FOR 'desenvolvimento'@'%';

GRANT ALL PRIVILEGES ON db_keter.* TO 'desenvolvimento'@'%';

FLUSH PRIVILEGES;

