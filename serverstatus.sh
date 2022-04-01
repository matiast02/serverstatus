#!/bin/bash
#title           :serverstatus.sh
#description     :Este script muestra el estado actual del servidor y los servicios corriendo.
#author		 :Matias Terradas
#date            :20220401
#version         :0.1    
#usage		 :bash serverstatus.sh
#notes           :Debe correr como sudo el script.
#==============================================================================


if ! [ $(id -u) = 0 ]; then
   echo "The script need to be run as root." >&2
   exit 1
fi

echo -e "\e[36m
   _____    ____  
  / ____|  / __ \ 
 | (___   | |  | |
  \___ \  | |  | |
  ____) | | |__| |
 |_____/   \____/ 
                  
\e[0m"

lsb_release -a
echo -e "\n"
echo -e "\e[1;32m === MEMORIA === \e[0m"
free --mega
echo -e "\n"

echo -e "\e[1;32m === ESTADO DEL SERVIDOR Y SERVICIOS === \e[0m"
echo -e "\e[36m
             _____                _____   _    _   ______ 
     /\     |  __ \      /\      / ____| | |  | | |  ____|
    /  \    | |__) |    /  \    | |      | |__| | | |__   
   / /\ \   |  ___/    / /\ \   | |      |  __  | |  __|  
  / ____ \  | |       / ____ \  | |____  | |  | | | |____ 
 /_/    \_\ |_|      /_/    \_\  \_____| |_|  |_| |______|
                                                          
\e[0m"

sudo apache2 -v
echo -e "\n"
echo -e "\e[1;32m === ESTADO DEL SERVIDOR === \e[0m"
echo -e "\n"
sudo service apache2 status | grep -E 'Active|Main|Tasks|Memory|CPU'


echo -e "\e[36m
  __  __            _____    ____    _      
 |  \/  |          / ____|  / __ \  | |     
 | \  / |  _   _  | (___   | |  | | | |     
 | |\/| | | | | |  \___ \  | |  | | | |     
 | |  | | | |_| |  ____) | | |__| | | |____ 
 |_|  |_|  \__, | |_____/   \___\_\ |______|
            __/ |                           
           |___/                            
\e[0m"

echo -e "\n"
mysql -V
echo -e "\n"
echo -e "\e[1;32m === ESTADO DEL SERVIDOR === \e[0m"
echo -e "\n"
sudo service mysql status | grep -E 'Active|Main|Status|Tasks|Memory|CPU'

echo -e "\e[36m
  _____    _    _   _____  
 |  __ \  | |  | | |  __ \ 
 | |__) | | |__| | | |__) |
 |  ___/  |  __  | |  ___/ 
 | |      | |  | | | |     
 |_|      |_|  |_| |_|     
                           
\e[0m"

php -v | grep 'cli'

echo -e "\e[36m
  _         ____     _____    _____                _____                _____   _    _   ______ 
 | |       / __ \   / ____|  / ____|       /\     |  __ \      /\      / ____| | |  | | |  ____|
 | |      | |  | | | |  __  | (___        /  \    | |__) |    /  \    | |      | |__| | | |__   
 | |      | |  | | | | |_ |  \___ \      / /\ \   |  ___/    / /\ \   | |      |  __  | |  __|  
 | |____  | |__| | | |__| |  ____) |    / ____ \  | |       / ____ \  | |____  | |  | | | |____ 
 |______|  \____/   \_____| |_____/    /_/    \_\ |_|      /_/    \_\  \_____| |_|  |_| |______|
                                                                                                
\e[0m"

echo -e "\e[1;32m === LOGS DE ERRORR === \e[0m"
sudo tail -100 /var/log/apache2/error.log
echo -e "\n\n\n"
echo -e "\e[1;32m === LOGS DE ACCESO === \e[0m"
sudo tail -100 /var/log/apache2/access.log
