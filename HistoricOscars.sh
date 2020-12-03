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
	case 1) until [$cont -ge $man]
		do
		sort k1 | oscar_age_male.csv >> aux
		cat aux
		done
	
	case 2)
	
	case 3)
	
	case *)
	
esac



