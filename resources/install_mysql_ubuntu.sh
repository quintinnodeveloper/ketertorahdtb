#Instalar MySQL
sudo nala install -y mysql-server mysql-client

#Acessar MySQL com root
sudo mysql -u root

#Alterar senha do root
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
FLUSH PRIVILEGES;
EXIT;

#Acessar com senha definida
mysql -u root -p

#Criar novo database
CREATE DATABASE db_keter;

CREATE USER 'desenvolvimento'@'%' IDENTIFIED BY 'desenvolvimento';

GRANT ALL PRIVILEGES ON db_keter.* TO 'desenvolvimento'@'%';

FLUSH PRIVILEGES;

#Acessar com URL JDBC
jdbc:mysql://localhost:3306/db_keter?allowPublicKeyRetrieval=true&useSSL=false
