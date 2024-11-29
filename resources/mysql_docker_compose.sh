sudo apt-get install docker-compose -y > /dev/null 2>&1

sudo docker stop mysql-container > /dev/null 2>&1
sudo docker rm mysql-container > /dev/null 2>&1

sudo docker-compose -f mysql_docker-compose.yml up -d

echo "Acesse o MySQL com JDBC usando a URL: jdbc:mysql://localhost:3306/mysql?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC"