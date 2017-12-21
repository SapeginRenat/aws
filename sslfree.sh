
#Install

$ sudo apt-get update
$ sudo apt-get install software-properties-common
$ sudo add-apt-repository ppa:certbot/certbot
$ sudo apt-get update
$ sudo apt-get install python-certbot-apache 

#Get Started

$ sudo certbot --apache

#Automating renewal

$ sudo certbot renew --dry-run
