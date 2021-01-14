#!/bin/bash

<<<<<<< HEAD
sortir=0

while [ $sortir -ne 1 ]
do
=======
>>>>>>> MENU

	echo "Base de Dades d'actors i actrius guanyador/es de l'Oscar"
	echo "1. Històric d'Oscars."
	echo "2. Qui va guanyar...?"
	echo "3. Ets un expert?"
	echo "4. Altes, baixes i modificacions."
	echo "0. Sortir."
	read opcio


	case $opcio in

	0)sortir=1;;

	1) 
	echo "En desenvolupament"
	echo "---------------------------------------------------------------------------------------"
	#read -p "$*"
	echo "Històric d’Oscars"
	echo "------------------"
	echo "1.1 Mostrar històric d’Oscars a millor actor (alfabètic). "
	echo "1.2 Mostrar històric d’Oscars a millor actriu (edat). "
	echo "1.3 Mostrar històric d’Oscars (actors/actrius). "

	read i 


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
	
	esac;;

	2)
	echo "En desenvolupament"
	echo "---------------------------------------------------------------------------------------"
	#read -p "$*"
	echo "---------------------------------------"
	echo "Qui va Guanyar ...?           "
	echo "---------------------------------------"
	echo "2.1 Mostrar l’actor i l’actriu que van guanyar un any determinat. "
	echo "2.2 Mostrar els Oscars a millor actriu guanyats per una actriu determinada. "
	echo "2.3 Mostrar els Oscars a millor actriu o actor que ha obtingut una pel·lícula determinada. "

	read var

	case $var in

	  1) 
	  echo "Diguem un any: "
		   read any  
		   i=1
		   j=1
		   lin=`wc -l < oscar_age_male.csv`
		   lin2=`wc -l < oscar_age_female.csv`
		   while [ $i -lt $lin ]
		   do	
		   	head -$i oscar_age_male.csv | tail -1 | grep $any > file1
		   	cat file1 >> file2
		   	let i=i+1		
		   done

		   while [ $j -lt $lin2 ]
		   do	
		   	head -$j oscar_age_female.csv | tail -1 | grep $any > file1
		   	cat file1 >> file2
		   	let j=j+1		
		   done

		nom=`cut -d, -f4 file2 | head -1 | sed 's/\"//g'`
		edat=`cut -d, -f3 file2 | head -1 | sed 's/\"//g'`
		peli=`cut -d, -f5 file2 | head -1 | sed 's/\"//g'`
		nom2=`cut -d, -f4 file2 | head -2 | tail -1 | sed 's/\"//g'`
		edat2=`cut -d, -f3 file2 | head -2 | tail -1 | sed 's/\"//g'`
		peli2=`cut -d, -f5 file2 | head -2 | tail -1 | sed 's/\"//g'`


		echo "Guanyadors any $any"
		echo "-------------------" 
		echo "Oscar a millor actor: $nom"
		echo "Edat: $edat"
		echo "Pel.lícula: $peli"
		echo "-------------------" 
		echo "Oscar a millor actriu: $nom2"
		echo "Edat: $edat2"
		echo "Pel.lícula: $peli2"
			   rm file1
			   rm file2;;

	  2)
	  echo "Escriu el nom i el cognom de l´actriu: "
		read nom cognom
		lin2=`wc -l < oscar_age_female.csv`
		j=1
		#cut -d, -f3 oscar_age_female.csv | tr -d ' " ' >> camp

		while [ $j -lt $lin2 ]
		   do	
		   	head -$j oscar_age_female.csv | tail -1 | sed 's/\"//g' | grep $nom | grep $cognom > file1
		   	cat file1 >> file2
		   	let j=j+1		
		   done
		   numOscars=`wc -l < file2`
		   m=1
		   nom=`cut -d, -f4 file2 | head -$m | tail -1 | sed 's/\"//g'`
		   echo "Oscars a millor actriu obtinuts per: $nom"
		   echo -e "\e[4mEdat     Any     Pel.lícula\e[0m"
		   while [ $m -le $numOscars ]
		   do
			edat=`cut -d, -f3 file2 | head -$m | tail -1 | sed 's/\"//g'`
			peli=`cut -d, -f5 file2 | head -$m | tail -1 | sed 's/\"//g'`
			any=`cut -d, -f2 file2 | head -$m | tail -1 | sed 's/\"//g'`
			   let m=m+1
			   echo $edat  "    $any    $peli"
		   done
		   rm file2
		   rm file1;;

		3)
		echo "Digues una pel.lícula: "
			read peli
			  i=1
			  j=1
			  b=0
			  a=0
			  lin=`wc -l < oscar_age_male.csv`
			  lin2=`wc -l < oscar_age_female.csv`

			  while [ $i -lt $lin ]
				   do	
					   head -$i oscar_age_male.csv | tail -1 | sed 's/\"//g' | grep "$peli" > file1
					   cat file1 >> file2
					   let i=i+1

				   done	  
				   numOscarsM=`wc -l < file2`

			   while [ $j -lt $lin ]
				   do	
					   head -$j oscar_age_female.csv | tail -1 | sed 's/\"//g' | grep "$peli" > file1
					   cat file1 >> file3
					   let j=j+1
				   done
				   	  
				numOscarsF=`wc -l < file3`

			echo "Oscars a millor actriu i actor obtinguts per:"
			echo $peli

				edat=`cut -d, -f3 file3 | head -1 | tail -1 | sed 's/\"//g'`


				nom=`cut -d, -f4 file3 | head -1 | tail -1 | sed 's/\"//g'`


				any=`cut -d, -f2 file3 | head -1 | tail -1 | sed 's/\"//g'`


				edat2=`cut -d, -f3 file2 | head -1 | tail -1 | sed 's/\"//g'`


				nom2=`cut -d, -f4 file2 | head -1 | tail -1 | sed 's/\"//g'`


				any2=`cut -d, -f2 file2 | head -1 | tail -1 | sed 's/\"//g'`

			echo "Any:$any $any2" 
			echo "------------------------------"
			echo "actriu:$nom"
			echo "edat:$edat"
			echo "actor:$nom2"
			echo "edat:$edat2"
			rm file2
			rm file3



	 ;;
		*) 
		echo "Error";;  

	esac;;

	3) echo "En desenvolupament"
	#read -p "$*";;


	4) echo "En desenvolupament"
	#read -p "$*";;

	*) echo "Error, caràcter $opcio no vàlid"
	#read -p "$*";;

	esac
	clear

done
