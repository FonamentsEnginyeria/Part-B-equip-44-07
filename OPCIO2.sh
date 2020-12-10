#!/bin/bash
echo "---------------------------------------"
echo "         Qui va Guanyar ...?           "
echo "---------------------------------------"
echo "2.1 Mostrar l’actor i l’actriu que van guanyar un any determinat. "
echo "2.2 Mostrar els Oscars a millor actriu guanyats per una actriu determinada. "
echo "2.3 Mostrar els Oscars a millor actriu o actor que ha obtingut
una pel·lícula determinada. " 

read var

case $var in
   1) echo "Diguem un any: "
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
   
   2)echo "Escriu el nom i el cognom de l´actriu: "
	read nom cognom
	lin2=`wc -l < oscar_age_female.csv`
	j=1
 	#cut -d, -f3 oscar_age_female.csv | tr -d ' " ' >> camp

     while [ $j -lt $lin2 ]
	   do	
	   	head -$j oscar_age_female.csv | tail -1 | sed 's/\"//g' | 			grep $nom | grep $cognom > file1
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

	3) ;;
	
	*) echo "Error";;   
	
esac	
	  

