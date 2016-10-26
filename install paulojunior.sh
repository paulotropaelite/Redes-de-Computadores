#!/bin/bash


#comando de instalação do openssh 
apt-get install openssh-server -y 


#comando de troca da porta padrão do ssh de 22 para 1000
sed -i "s/Port 22/Port 10000/g" /etc/ssh/sshd_config 



#comando de reinicialização do serviço
/etc/init.d/ssh restart 

