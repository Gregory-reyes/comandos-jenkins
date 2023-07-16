#Actualizar Ubuntu 20.04
sudo apt-get update

#Uso de un repositorio a través de HTTPS
sudo apt-get install ca-certificates curl gnupg

#Agregue la clave GPG oficial de Docker
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

#Comando para configurar el repositorio
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#actualizamos nuevamente con el comando 
sudo apt-get update

#Instale Docker Engine, container Docker Compose
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#Verifique que la instalación de Docker Engine
sudo docker run hello-world

#Comando para comenzar docker en digital ocean
systemctl start docker

#Comando para dar permisos al root
sudo usermod -aG docker root

