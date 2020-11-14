echo "Uninstall old versions"
sudo apt-get remove docker docker-engine docker.io containerd runc
echo "Update the apt package index"
sudo apt-get update
echo "Install packadges for used repozitories from HTTPS"
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
echo "Add Docker’s official GPG key:"
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo "Verify that you now have the key with the fingerprin"
sudo apt-key fingerprint 0EBFCD88
echo "To add the nightly or test repository, add the word nightly/test:"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"  
echo "Update the apt package index"
sudo apt-get update
echo "INSTALL DOCKER ENGINE:"
sudo apt-get install docker-ce docker-ce-cli containerd.io
#sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io
echo "Verify that Docker Engine is installed correctly by running the hello-world image"
sudo docker run hello-world
echo "docker version:"
sudo docker --version
echo "Adding our user to the “docker” group:"
sudo usermod -a -G docker vladimir
echo "..............................................................................."
echo "..............................................................................."
echo "Migrations Compose"

echo "Install Docker Compose"
echo "Download the current stable release of Docker Compose:"
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
echo "Apply executable permissions to the binary:"
sudo chmod +x /usr/local/bin/docker-compose
echo "Check path. We can also create a symbolic link to /usr/bin or any other directory in your path"
sudo ln -s /usr/local/bin/docker-compose
sudo ln -s /usr/bin/docker-compose
echo "Test the installation"
sudo docker-compose --version
echo "Login in DockerHub:"
sudo docker login --username=vladiimir --password=vladrock01
echo "Password from /root/.docker/config.json:"
sudo cat /root/.docker/config.json

