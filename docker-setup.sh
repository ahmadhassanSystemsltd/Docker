sudo yum install -y yum-utils 
sudo yum-config-manager --add-repo   https://download.docker.com/linux/centos/docker-ce.repo 
sudo yum -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
sudo usermod -aG docker username 
sudo systemctl restart docker 
To run the below command wait for 5 Sec 
sleep(5)
sudo chmod 666 /var/run/docker.sock 
sudo systemctl restart docker 
