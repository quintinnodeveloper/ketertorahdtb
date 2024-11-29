#!/bin/bash

# Atualizar pacotes do sistema
sudo nala update -y > /dev/null 2>&1 && sudo nala upgrade -y > /dev/null 2>&1

# Instalar Docker, se ainda não estiver instalado
if ! command -v docker &> /dev/null; then
    sudo apt install -y docker.io > /dev/null 2>&1
fi

# Habilitar e iniciar o Docker
sudo systemctl enable --now docker > /dev/null 2>&1

# Baixar a imagem mais recente do MySQL
sudo docker pull mysql:latest > /dev/null 2>&1

# Parar e remover o container existente, se houver
sudo docker stop mysql-container > /dev/null 2>&1
sudo docker rm mysql-container > /dev/null 2>&1

# Criar e executar o container do MySQL com persistência de dados
sudo docker run --name mysql-container -e MYSQL_ROOT_PASSWORD='$2a$12$dN/ViXzE1MqM8bn.Cx01Hu522CwEEPFoW2w7UFrUSHwkA3cQxpSma' -p 3306:3306 -v /meu/caminho/mysql/data:/var/lib/mysql -d mysql:latest > /dev/null 2>&1

# Esperar alguns segundos para garantir que o container MySQL foi inicializado
sleep 5

# Modificar as permissões do MySQL para permitir conexões externas (IP do Docker)
# Acessar o MySQL via Docker
sudo docker exec -it mysql-container mysql -u root -p'$2a$12$dN/ViXzE1MqM8bn.Cx01Hu522CwEEPFoW2w7UFrUSHwkA3cQxpSma' -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$2a$12$dN/ViXzE1MqM8bn.Cx01Hu522CwEEPFoW2w7UFrUSHwkA3cQxpSma' WITH GRANT OPTION; FLUSH PRIVILEGES;" > /dev/null 2>&1

# Modificar a configuração do MySQL para escutar em todas as interfaces (0.0.0.0)
# Para permitir conexões externas, altere o bind-address do MySQL para 0.0.0.0
# Isso exige que você modifique o arquivo de configuração do MySQL dentro do container.

sudo docker exec -it mysql-container bash -c "sed -i 's/^bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf"
sudo docker exec -it mysql-container bash -c "service mysql restart" > /dev/null 2>&1

# Obter o IP do container MySQL (caso você prefira conectar diretamente via IP do container)
IP_MYSQL=$(sudo docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' mysql-container)

# Instruções finais
echo "Acesse o MySQL com JDBC usando a URL: jdbc:mysql://$IP_MYSQL:3306/mysql?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC"

# Exibir logs do MySQL (opcional, para depuração)
# sudo docker logs mysql-container
