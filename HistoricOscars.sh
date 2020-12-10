#!/bin/bash

cont=2
man=`wc -l < oscar_age_male.csv`
woman=`wc -l < oscar_age_female.csv`


echo "Històric d’Oscars"
echo "------------------"
echo "1.1 Mostrar històric d’Oscars a millor actor (alfabètic). "
echo "1.2 Mostrar històric d’Oscars a millor actriu (edat). "
echo "1.3 Mostrar històric d’Oscars (actors/actrius). "

read i 

echo $man
echo $woman

case $i in 

	1)	
	echo "Edat	Actor		Any	Pelicula"
	tail +2 oscar_age_male.csv | sort -k 4 >> aux
	awk -F "\"*,\"*" '{print $4, $2, $3, $5}' aux
	rm aux
	
	2) 	
	echo "Actriu		Any	Edat	Pelicula"
	tail +2 oscar_age_female.csv | sort -k 3 >> aux
	awk -F "\"*,\"*" '{print $3, $4, $2, $5}' aux
	rm aux
	
	3)	echo "Any	Actor/Actriu		Edat	Pelicula"
	tail +2 oscar_age_female.csv | sort -k 2 >> aux
	tail +2 oscar_age_female.csv | sort -k 2 >> aux
	sort -k 2 aux
	awk -F "\"*,\"*" '{print $2, $4, $3, $5}' aux
	rm aux
	
	*)
	
esac



