#! /usr/bin/bash


#adding repos for nala

echo "


Adding repos for Nala....

"
echo "deb https://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list


wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null


#updating & installing nala

echo "


Installing Nala for you...."

sudo apt update -qq && sudo apt install nala -yyqq

echo "


Done"
