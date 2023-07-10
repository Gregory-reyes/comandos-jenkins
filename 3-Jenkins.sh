#comando para instalar jenkins
docker pull jenkins/jenkins

#Creacion de una carpeta
mkdir -p jenkins/jenkins_home

#Creacion de permisos
chmod 1000 jenkins

#crear el docker-compose primero ingresado al archivo con: cd jenkins
vi docker-compose.yml

#Iniciarlo con docker-compose
docker-compose up -d

#Establece servicio se guarda al final ESC y luego :wq! para guardar
version: '3'
services:
  jenkins:
    user: root
    image: jenkins/jenkins
    ports:
      - 8080:8080
      - 50000:50000
      container_name: jenkins
      volumes:
	- $PWD/jenkins_home:/var/jenkins_home
      networks:
	- net
networks:
 net:

#Para ver el servicio
cat docker-compose.yml

#Iniciarlizar el docker-compose
docker-compose up -d

#reiniciar el docker-compose
docker-compose restart

#Ingresar a la carpeta con: cd jenkins y ejecutar el siguiente comando
docker exec -ti jenkins bash

#Ingresamos al Pagina de jenkins :8080  la ruta para validar la contraseña por primera vez
cat /var/jenkins_home/secrets/initialAdminPassword