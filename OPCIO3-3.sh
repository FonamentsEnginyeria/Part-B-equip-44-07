#!/bin/bash
tail +2 oscar_age_male.csv >> aux
tail +2 oscar_age_female.csv >> aux

lt=`wc -l < aux`
#linies totals

ran1=`echo $(($RANDOM%$lt+1))`

#numero random

nom=`cut -d, -f4 aux | head -$ran1 | tail -1 | sed 's/\"//g'`
edat=`cut -d, -f3 aux | head -$ran1 | tail -1 | sed  's/\"//g'`
any=`cut -d, -f2 aux | head -$ran1 | tail -1 | sed 's/\"//g'`
lin=90
if [ $ran1 -le $lin ] 
then
	genero="actor"
else
	genero="actriu"	
fi

echo "$nom amb $edat anys l'any $any va guanyar l'Oscar a millor $genero per la seva interpetació a: "

peli1=`cut -d, -f5 aux | head -$ran1 | tail -1 | sed 's/\"//g'`
#peli1 és la película correcte

echo "---------------------------------------------------------------"

ran2=`echo $(($RANDOM%$lt+1))`
#numero random

peli2=`cut -d, -f5 aux | head -$ran2 | tail -1 | sed 's/\"//g'`
#películ.la seleccionada aleatoriament


ran3=`echo $(($RANDOM%$lt+1))`

peli3=`cut -d, -f5 aux | head -$ran3 | tail -1 | sed 's/\"//g'`


numran=`echo $(($RANDOM%3+1))`
#tria el lloc 'aleatoriament' d'on anirà la películ.la correcte.

if [ $numran -eq 1 ] ;
then
   echo "1)    $peli1"
   echo "2)    $peli2"
   echo "3)    $peli3"
   echo "Selecciona una opció [1,2,3]"
   read var
   	if [ $var -eq $numran ]
   	then
   	 echo "FELICITATS! Resposta Correcte"
   	else	
   	 echo "T'has equivocat! La solució correcte era l'opció $numran"
   	fi 
else
	if [ $numran -eq 2 ] 
	then
	   echo "1)    $peli2"
	   echo "2)    $peli1"
	   echo "3)    $peli3"
	   echo "Selecciona una opció [1,2,3]"
	   read var
	   	if [ $var -eq $numran ]
	   	then
	   	 echo "FELICITATS! Resposta Correcte"
	   	else	
	   	 echo "T'has equivocat! La solució correcte era l'opció $numran"
	   	fi 
	 else	
		 if [ $numran -eq 3 ] 
		 then
		   echo "1)    $peli2"
		   echo "2)    $peli3"
		   echo "3)    $peli1"
		   echo "Selecciona una opció [1,2,3]"
		   read var
		   	if [ $var -eq $numran ]
		   	then
		   	 echo "FELICITATS! Resposta Correcte"
		   	else	
		   	 echo "T'has equivocat! La solució correcte era l'opció $numran"
		   	fi 
		  fi
	  fi	   	
	   	
fi

rm aux




 


