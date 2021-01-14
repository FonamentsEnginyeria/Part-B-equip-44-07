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
	;;
	*)
	
esac
