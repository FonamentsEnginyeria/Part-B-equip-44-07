#!/bin/bash

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
rm aux

