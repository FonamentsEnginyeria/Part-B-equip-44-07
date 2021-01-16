#!/bin/bash

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
           
fi

