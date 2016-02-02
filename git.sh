#!/bin/bash

# Mise en forme
#+ Couleur de base
RESETC="$(tput sgr0)"
# Couleurs + Gras
# Rouge
RED="$(tput bold ; tput setaf 1)"
# Vert
GREEN="$(tput bold ; tput setaf 2)"
# Jaune
YELLOW="$(tput bold ; tput setaf 3)"
# Bleu
BLUE="$(tput bold ; tput setaf 4)"

clear

tput cup 2 3
echo "{$GREEN}Script de création de dépôt git"
echo ""
echo ""

read -p 'Nom utilisateur Githug :' user
echo ""
read -p 'Mot de passe :' -s pass
echo ""
echo ""
read -p 'Nom du dossier à créer :' dossier
echo ""
read -p 'Chemin de destination du dossier :' chemin
echo ""


# ---- Création du dossier à l'emplacement  indiqué
cd $chemin
sudo mkdir $dossier
cd $dossier
sudo touch README.md
sudo git init

# --- Création du repo distant
sudo curl -u $user:$pass https://api.github.com/user/repos -d '{"name":"'$dossier'"}'


echo "Création du dossier $dossier à l'emplacement $chemin : OK"
echo ""
echo "Création du repo distant $dossier : OK"

echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'


# ---- GITHUB
sudo git remote add origin https://github.com/$user/$dossier.git
sudo git add README.md
sudo git commit -m "first commit"
sudo git push -u origin master


