
#Descargar e instalar docker-compose
sudo curl -SL https://github.com/docker/compose/releases/download/v2.19.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
#sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

#Aplicar permisos al binario
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

#Aplicar permisos al ejecutable
sudo chmod +x /usr/local/bin/docker-compose

#Comprobar funcionamiento de docker-compose
docker-compose --version

#Establece servicio de docker compose con postgres y adminer
version: '3.1'

services:

  db:
    image: postgres
    restart: always
    ports:
      - 5432:5432
    environment:
      - DATABASE_HOST=127.0.0.1
      - POSTGRES_PASSWORD:gregory
      - POSTGRES_USER:gregory
      - POSTGRES_DB:gregorydb

  adminer:
    image: adminer
    restart: always
    ports:
      - 8000:8080



