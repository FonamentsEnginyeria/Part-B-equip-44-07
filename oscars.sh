#!/bin/bash

sortir=0

while [ $sortir -ne 1 ]
do

echo "Base de Dades d'actors i actrius guanyador/es de l'Oscar"
echo "1. Històric d'Oscars."
echo "2. Qui va guanyar...?"
echo "3. Ets un expert?"
echo "4. Altes, baixes i modificacions."
echo "0. Sortir."

read opcio 
case $opcio in
0)sortir=1;;
1) echo "En desenvolupament"
read -p "$*";;
2) echo "En desenvolupament"
read -p "$*";;
3) echo "En desenvolupament"
read -p "$*";;
4) echo "En desenvolupament"
read -p "$*";;
*) echo "Error, caràcter $opcio no vàlid"
read -p "$*";;
esac

clear

done

done

