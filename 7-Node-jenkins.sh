#instalamos nodejs en jenkins ingresamos a la plataforma  administrar jenkins
administrar jenkins -> administrar plugins -> instalados -> buscamos nodejs y lo instalamos

#ingresamos a la plataforma  administrar jenkins
administrar jenkins -> configurar el sistema -> buscamos nodejs -> damos agregar nodejs -> colocamos un nombre -> damos instalar automáticamente -> colocamos la version de nodejs -> damos guardar

#creamos una nueva tarea en la plataforma de jenkins y la llamamos 
Aplicacion Node.js -> damos en construir un proyecto de estilo libre -> damos guardar

#diligenciamos la siguiente informacion
creamos la descripcion -> configurar el origen del codigo fuente -> escojemos Git -> colocamos el clone del repositorio -> en ejecutar añaadimos shell 
-> colocamos el siguiente codigo -> npm install -> en la parte de arriba seleccionamos Provide Node & npm bin/ folder to PATH -> damos guardar -> construir ahora

#entramos al contenedor jenkins
docker exec -ti jenkins bash

#Ingresamos a la ruta de la aplicacion nodejs que nos dio la plataforma de jenkins
cd /var/jenkins_home/workspace/

#miramos en ls y ingresamos Aplicacion node.js
cd "Aplicacion node.js"

#ejecutamos el siguiente comando para ver el contenido de la carpeta
ls -la 

#entramos a la carpeta node_modules
cd node_modules/

#empaquetamos la aplicacion nodejs con docker empezamos isntalando plugin en la plataforma de jenkins
administrar jenkins -> administrar plugins -> instalados -> buscamos CloudBees Docker Build and Publish -> lo instalamos -> NO reiniciamos jenkins

#ingresamo a la aplicación nodejs y en la plataforma de jenkins damos en configurar
al final de la pagina -> añadir un nuevo paso -> seleccionamos docker build and publish -> colocamos el nombre de la imagen -> damos guardar

#copiamos el repositorio de dockerhub y lo copiamos en el jenkins
gregoryreyesp/nodejsapp

#en Registry credentials agregamos nuestro usuario y contraseña de dockerhub
seleccionamos la opcion creada de nuestro usuario y contraseña y damos guardar

#hacer docker login en la consola de visual studio vamos al inicio de todo code cd $HOME ingresamos usuario y contraseña dockerhub
docker login

#nos devolvemos a la plataforma de jenkins y damos en construir ahora
deberia funcionar se verifica en console output

#hacer un pull de la imagen de dockerhub cd $HOME
docker pull gregoryreyesp/nodejsapp

#expone el puerto 3000
docker run -d -p 3000:3000 --name nodejsapp gregoryreyesp/nodejsapp

#verificar que este corriendo el contenedor
docker ps

#verificar que este corriendo el contenedor
curl localhost:3000









