#!/bin/bash

echo "--------------------------------------------------"
echo "     Sistema Gestor de la Base de Dades" 
echo "--------------------------------------------------"
echo "4.1 Alta (1)"
echo "4.2 Baixa (2)"
echo "4.3 Modificació (3)"

read sistema

case $sistema in
	1) 
	rm file1

	echo "Vols afegir un actor o actriu"
	echo "1 - ACTOR" 
	echo "2 - ACTRIU" 
	read number 

	if [ $number -eq "1" ] 
	then 
	tail +2 oscar_age_male.csv > aux 
	else
	tail +2 oscar_age_female.csv > aux 
	fi

	echo "Escriu el nom de l’actor o actriu"
	read nom
	echo "Escriu l’any que l’actor o actriu va guanyar l’Oscar"
	read any
	echo "Escriu l’edat de l’actor o actriu quan va guanyar l’oscar"
	read edat
	echo "Escriu en quina pel·licula l’actor o actriu va guanyar l’Oscar"
	read pelicula

	m=0
	let m=$any-1927
	if [ $m -le 0 ]
	then
		m=1
	fi

	anyrepe=`cut -d, -f2 aux | head -$m | tail -1`

	numindexfinal=`wc -l < aux`
	let index=$numindexfinal+1

	if [ $any -eq "$anyrepe" ]
	then 
		echo "Aquest any ja existeix"
	else
		echo "Aquest any no existeix"
		if [ $any -lt "1928" ] 
		then
			echo $index, $any, $edat, $nom, $pelicula >> file1
			cat aux >> file1
		fi
	fi
	rm aux
	;;
	2)
	echo "-----------------------------------------------------------"
	echo "Vols donar de baixa algun actor o actrius?"
	echo "1 - ACTOR"
	echo "2 - ACTRIU"

	read number

	if [ $number -eq "1" ]
	then
	    tail +2 oscar_age_male.csv >> aux
	else    
	    tail +2 oscar_age_female.csv >> aux
	fi    

	echo "-----------------------------------------------------------"
	echo "Quin any vols escollir"

	read any
	i=1
		   lin=`wc -l < aux`
		   while [ $i -lt $lin ]
		   do    
		       head -$i aux | tail -1 | grep $any >> file1
		       let i=i+1        
		   done
		   m=1
		   numOscars=`wc -l < file1`
		   while [ $m -le $numOscars ]
			   do
				edat=`cut -d, -f3 file1 | head -$m | tail -1 | sed 's/\"//g'`
			 	peli=`cut -d, -f5 file1 | head -$m | tail -1 | sed 's/\"//g'`
				nom=`cut -d, -f4 file1 | head -$m | tail -1 | sed 's/\"//g'`
				   let m=m+1
				echo "ANY: $any, NOM: $nom, EDAT: $edat, Pel·lícula: $peli."					   
			   done
		   
		   
	#grep "$any" aux >> fitxer

	#awk `$2 -eq $any {print $2","$3","$4","$5}` aux >> fitxer
	#cat fitxer

	oscarany=0
	let orscarany=$any-1927
	echo "Vols eliminar el registre del fitxer? S/N?" 
	read resposta


	if [ $resposta == "S" ] || [ $resposta == "s" ];
	then 
		echo "Suprimint..."
		#sed -i $oscarany file 2    
		let num="$any-1927"
	    	let resta="$lin-$num"
	    	let suma="$num-1"
	    	head -$suma aux > oscar_age
	    	tail -$resta aux >> oscar_age
	    	#cat oscar_age

	else 
		echo "No s'ha suprimit el registre"
	fi


	rm file1
	rm aux;;
	
	3)
		
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
	;;
	*)
	
esac
