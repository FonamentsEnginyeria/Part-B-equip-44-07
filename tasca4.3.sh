#!/bin/bash

echo "Vols modifica la informació d'un actor o actriu?"
echo "1 - ACTOR"
echo "2 - ACTRIU"
echo "Escriu la teva opció amb majuscules"
read OPCIO
if [ $OPCIO == "ACTOR" ]
then
	tail +2 oscar_age_male.csv > aux
else	
	tail +2 oscar_age_female.csv > aux
fi	

echo "Diguem un any"
read any
i=1
lin=`wc -l < aux`
	while [ $i -lt $lin ]
	do	
	  head -$i aux | tail -1 | grep $any >> file1
	  let i=i+1		
        done
cat file1
nom=`cut -d, -f4 file1`  
edat=`cut -d, -f3 file1`
peli=`cut -d, -f5 file1` 
numOscars=`wc -l < file1`	
num=`cut -d, -f1 file1`
echo "Diguem un nou nom i cognom: "
read nom2
	if [ $nom2 == "=" ]
		then
		echo $nom > nomartista
		nom=`sed 's/\"//g' nomartista`
		#fem això per treure-li les cometes que té de sobres
		nom2=$nom	
		#Si l'usuari escriu un "=" llavors el nom final serà l'anterior
	fi
				
echo "Diguem un nou any: "
read any2
	if [ $any2 == "=" ]
		then
		any2=$any	
		#Si l'usuari escriu un "=" llavors el any final serà l'anterior
	fi
	
echo "Diguem el nou valor de l'edat amb que va guanyar l'Oscar: "
read edat2
	if [ $edat2 == "=" ]
		then
		edat2=$edat	
		#Si l'usuari escriu un "=" llavors l'edat final serà l'anterior
	fi
echo "Diguem amb quina pel.lícula va guanyar l'Oscar: "
read peli2	   
	if [ $peli2 == "=" ]
		then
		echo $peli > nomartista
		peli=`sed 's/\"//g' nomartista`
		#fem això per treure-li les cometes que té de sobres
		peli2=$peli	
		#Si l'usuari escriu un "=" llavors la pel.lícula final serà l'anterior
	fi

	
	let suma="$num-1"
	let resta="$lin-$num"
	head -$suma aux > oscar_age
	#treballem el fitxer per borrar la linia corresponent
	tail -$resta aux >> oscar_age

	echo $nom2 > nombre
	echo $peli2 > pelicu
	#posem el nom i la pelicul.la entre cometes
	nom3=`sed 's/^/"/;s/$/"/' nombre`
	peli3=`sed 's/^/"/;s/$/"/' pelicu`

	
	let num2="$any2-1927"
	echo "$num2, $any2," $edat2", $nom3, $peli3" > file4
	
   	m=0
			
		anyrepe=`cut -d, -f2 oscar_age | head -$num2 | tail -1`
	
			
			if [ $any2 -eq $anyrepe ]
			then 
				echo "Aquest any ja existeix"
			else
			       let suma2="$num2-1"
			       linewaux=`wc -l < oscar_age`
			       let resta2="$linnewaux-$num2"
				       if [ $num2 -lt "89" ]
				       then
				       head -$suma2 oscar_age > oscars
				       cat file4 >> oscars
				       tail -$resta oscar_age >> oscars
				       cat oscars
				       else
				       head -$suma2 oscar_age > oscars
				       cat file4 >> oscars
				       cat oscars
				       fi
				       
			     rm oscars
				
			fi

#amb aquest if sabem si hem de classificar la informació entrada per	l'usuari
  
rm file1
rm file4
#rm fitxeru	   
rm pelicu
rm nombre


