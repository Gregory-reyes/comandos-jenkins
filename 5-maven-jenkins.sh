#instalación de plugins y configuración de Maven
Estamos en Jenkins y nos dirigimos a la parte de configuraciones, Ingresamos a administrar plugin, 
Verificamos la instalación de github y Maven si no se encuentra se instalan por este lado.
Y ya debería estar instalado Maiven

#configuración de Maven
Le colocamos el nombre y le damos guardar dejamos Automática y le damos guardar

#clonamos el repositorio para el ejercicio Maven
Clonamos el repositorio github que utilizamos para la implementación del ejercicio https://github.com/macloujulian/simple-java-maven-app

#lo ejecutamos la clonación del repositorio en Jenkins
Creamos una nueva tarea dentro del portal de Jenkins, colocamos un nombre, damos crear un proyecto de selección libre le damos una descripción
y Seleccionamos el origen la opción de git, pegamos la URL que pegamos en github seleccionamos la rama del repositorio y guardamos y damas construir.

#Ingresamos al contenedor Jenkins con el siguiente comando 
docker exec -ti jenkins bash

#copiamos la ruta que no sdio Jenkins para ingresar al contenedor
cd /var/jenkins_home/workspace/

# damos ls e ingresamos a la app con el nombre de la app que creamos
cd "Java app con maven"

#ingresamos a la plataforma y nos dirigimos a configurar
nos dirijimos añadir paso, y damos ejecutar tareas con Maven nivel superior diligenciamos la información
- version Maven = seleccionamos el que colocamos el nombre
- goles = colocamos la informacion que esta en la carpeta del repositorio del github que es la siguiente ruta:
-> carpeta jenkins -> Jenkinsfile -> -B -DskipTests clean package
-damos contruir ahora y nos da un .jar en la consola de Jenkins para poder ingresar a la console de visual studio code

#Ingresamos al contenedor Jenkins con el siguiente comando 
docker exec -ti jenkins bash

# colocamos la ruta del workspace que no sdio jenkins y los copiamos
cd /var/jenkins_home/workspace/

# damos ls e ingresamos a la app con el nombre de la app que creamos
cd "Java app con maven"

#ingresamos a la carpeta target
cd target

#implementando pruebas unitarias de la stage('Test') en dentro del sh solo copiamo el test
-> carpeta jenkins -> Jenkinsfile -> test

#Nos devolvemos a la plataforma Jenkins ingresamos a la aplicación Maven
- Ingresamos a configurar -> en la seccion de ejecutar añadimos un nuevo paso -> Ejecutar tareas con Maven nivel superior
-> selecionamos la opción del nombre que creamos -> goles -> copiamos test 

#añadimos una accion al final para activar la opcion de test
escogemos publicar los resultados de tests unit -> en ficheros xml colocamos -> target/surefire-reports/*.xml -> damos guardar
- posterior damos construir y entramos a la consola, ademas se adiciona una opcion de visual de la prueba

#copiamos el directorio que no salio en Jenkins para ingresar al contenedor regresamos al visual studio code
docker exec -ti jenkins bash

#entramos a la ruta del workspace
cd /var/jenkins_home/workspace/

#ingresamos a la carpeta del proyecto
cd "Java app con maven"

#ingresamos a la carpeta target
cd target

#ejecutamos pwd para ver la ruta y la copiamos
pwd

#no dirijimos a la platorforma de Jenkins y nos dirijimos al archivo de Maven ingresamos a configurar
- en la seccion de ejecutar añadimos un nuevo paso -> Ejecutar lineas de comando en un shell -> copiamos un comentario -> 
echo "entrega de aplicacion" y copiamos la ruta /var/jenkins_home/workspace/Java\ app\ con\ maven/target/my-app-1.0-SNAPSHOT.jar
-> damos guardar -> damos contruir para verificar su funcionamiento en la consola nos debe salir el comentario que hicimos.

#mostrar el ultimo jar que se ejecuto satisfactoriamente
ingresado a la aplicacion maven en la plataforma de Jenkins -> ingresamos a configurar -> en la seccion de ejecutar añadimos un nuevo paso -> 
guardar los archivos generados -> en ficheros para guardar colocamos-> target/*.jar ->selecionamos la opcion archive artifacts only if build is successful
-> damos guardar






