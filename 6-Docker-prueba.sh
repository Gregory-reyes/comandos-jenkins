#Descargamos la imagen hello-world en las imagenes de Docker 
https://hub.docker.com/_/hello-world

#en la parte de simple tags descargamos opción de linux
https://github.com/docker-library/hello-world/blob/3fb6ebca4163bf5b9cc496ac3e8f11cb1e754aee/amd64/hello-world/Dockerfile

#pero para esta parte se va implementar un repositorio ya creado en github del curso y lo clonamos
https://github.com/macloujulian/dockerjenkins.git

# la ruta debe estar en el cd de jenkins y clonamos el repositorio
git clone https://github.com/macloujulian/dockerjenkins.git

#entramos a la carpeta del repositorio
cd dockerjenkins/

# ejecutamos el comando para ver el archivo en mas detalle
cat Dockerfile

#nos devolvemos a la carpeta de jenkins con cd .. y ejecutamos el siguiente comando
vi docker-compose.yml

#se ajusta el docker compose para que se pueda ejecutar el dockerfile agregando unas lineas
version: '3'
services:
  jenkins:
    user: root
    image: jenkins/docker
    build:
      context: dockerjenkins
    ports:
      - 8080:8080
      - 50000:50000
    container_name: jenkins
    volumes:
      - $PWD/jenkins_home:/var/jenkins_home
      - /var/run/docker.sock:/var/run/docker.sock
    networks:
      - net
networks:
 net:

#bajar el docker compose con el siguiente comando
docker-compose stop

# se vuelve a construir para que tome los cambios
docker-compose build

#ejecutamos comando para ver la imagen
docker images | grep docker

#recreamos el contenenor de jenkins con el siguiente comando
docker-compose up -d

#entramos al contenedor 
docker exec -ti jenkins bash

# damos unos permisos para que pueda ejecutar el docker
chown jenkins /var/run/docker.sock

#salimos del contenedor
exit

#



