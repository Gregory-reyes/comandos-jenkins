
#Descargar e instalar docker-compose
curl -SL https://github.com/docker/compose/releases/download/v2.19.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose

#Aplicar permisos al binario
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

#Aplicar permisos al ejecutable
    sudo chmod +x /usr/local/bin/docker-compose

#Comprobar funcionamiento de docker-compose
docker-compose --version




