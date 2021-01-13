#!/bin/bash

echo "-------------------------------------------------- "
echo "                 Ets un Expert?"
echo "-------------------------------------------------- "
echo "3.1 Saps l’any que va guanyar l’Oscar ...? (1)"
echo "3.2 Qui va guanyar l’Oscar a millor actor o actriu l’any ...? (2)"
echo "3.3 Quina pel·lícula va guanyar l’Oscar a millor actor o actriu ...? (3)"

read expert

case $expert in
	1) 
	tail +2 oscar_age_male.csv >> aux
	tail +2 oscar_age_female.csv >> aux
	var=`wc -l < aux`

	random=`echo $(($RANDOM%$var+1))`
	#per omplir el echo de la pregunta

	peli=`cut -d, -f5 aux | head -$random | tail -1 | sed 's/\"//g'`
	any=`cut -d, -f2 aux | head -$random | tail -1 | sed 's/\"//g'`
	edat=`cut -d, -f3 aux | head -$random | tail -1 | sed 's/\"//g'`
	nom=`cut -d, -f4 aux | head -$random | tail -1 | sed 's/\"//g'`

	if [ $random -le 91 ]
	then
	    genere="actor"
	else
	    genere="actriu"
	fi

	#pregunta a respondre
	echo "Quin any $nom amb $edat anys va guanyar l’Oscar a millor $genere amb la pel·licula “$peli”..."

	read anyintroduit

	if [ $anyintroduit -eq $any ]
	then
	    echo "Felicitats, és correcte."
	else
	    echo "T'has equivocat. L'any correcte és $any"

	fi
	rm aux;;
	
	2)
	tail +2 oscar_age_male.csv  >> aux
	tail +2 oscar_age_female.csv >> aux
	var=`wc -l < aux`

	#tres actors aleatoris, random és el correcte
	random=`echo $(($RANDOM%$var+1))`

	ale1=`echo $(($RANDOM%$var+1))`
	ale2=`echo $(($RANDOM%$var+1))`

	#per omplir el echo de la pregunta

	peli=`cut -d, -f5 aux | head -$random | tail -1 | sed 's/\"//g'`
	#el sed es per treure les cometes de fitxer

	any=`cut -d, -f2 aux | head -$random | tail -1 | sed 's/\"//g'`
	edat=`cut -d, -f3 aux | head -$random | tail -1 | sed 's/\"//g'`
	lin=91
	    if [ $random -le $lin ]
	    then
		genere="actor"
	    else
		genere="actriu"
	    fi

	nom=`cut -d, -f4 aux | head -$random | tail -1 | sed 's/\"//g'`
	error1=`cut -d, -f4 aux | head -$ale1 | tail -1 | sed 's/\"//g'`
	error2=`cut -d, -f4 aux | head -$ale2 | tail -1 | sed 's/\"//g'`


	#exercici o pregunta a respondre
	echo "La pel·lícula $peli a l'any $any va guanyar l'Oscar a millor $genere per la interpretació de l'$genere de $edat anys:"
	echo "------------------------------------------------------------"

	numran=`echo $(($RANDOM%3 + 1))`

	#tria el lloc 'aleatoriament' d'on anirà la películ.la correcte.

	if [ $numran -eq 1 ] ;
	then
	   echo "1)    $nom"
	   echo "2)    $error1"
	   echo "3)    $error2"
	   echo "Selecciona una opció [1,2,3]"
	   read res
	       if [ $res -eq $numran ]
	       then
		echo "FELICITATS! Resposta Correcte"
	       else    
		echo "T'has equivocat! La solució correcte era l'opció $numran"
	       fi 
	else
	    if [ $numran -eq 2 ] ;
	    then
	       echo "1)    $error1"
	       echo "2)    $nom"
	       echo "3)    $error2"
	       echo "Selecciona una opció [1,2,3]"
	       read res
		   if [ $res -eq $numran ]
		   then
		    echo "FELICITATS! Resposta Correcte"
		   else    
		    echo "T'has equivocat! La solució correcte era l'opció $numran"
		   fi 
	     else    
		 if [ $numran -eq 3 ] ;
		 then
		   echo "1)    $error2"
		   echo "2)    $error1"
		   echo "3)    $nom"
		   echo "Selecciona una opció [1,2,3]"
		   read res
		       if [ $res -eq $numran ]
		       then
		        echo "FELICITATS! Resposta Correcte"
		       else    
		        echo "T'has equivocat! La solució correcte era l'opció $numran"
		       fi 
		  fi
	      fi           
		   
	fi;;
	
	3)
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

	rm aux;;
	*)
	
esac
