#Entrar al contenedor Jenkins primero ingresamos al archivo: cd jenkins 
docker exec -ti jenkins bash

#Creacion Primer comentario 
echo "Mi primer jenkins"

#Comando para crear el primer for
vi script_prueba.sh

#Creación de for
#!/bin/bash
nombre=”GREGORY”
#Empezar el loop
for a in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
do
    # if a es igual a 8 que el loop descanse
    if [ $a == 8 ]
    then
      sleep 15
      echo “A descansar de clase $nombre”
    fi
    echo "Clase Nº $a"
done

#Colocar permisos para el for
chmod +x script_prueba.sh

#Copia del script realizado con el For para implementar en jenkins
docker cp script_prueba.sh jenkins:/opt

#Ingreso al Jenkins del docker creado
docker exec -ti jenkins bash

#Prueba script en terminal Primero ingresamos a: cd opt
./script_prueba.sh

#Creación de un nuevo job con booleano en Jenkins
