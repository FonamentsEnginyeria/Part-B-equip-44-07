#!/bin/bash

sortir=0

while [ $sortir -ne 1 ]
do

	echo "---------------------------------------------------------------------------------------"
	echo "Base de Dades d'actors i actrius guanyador/es de l'Oscar"
	echo "---------------------------------------------------------------------------------------"
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
	echo "Històric d’Oscars"
	echo "------------------"
	echo "1.1 Mostrar històric d’Oscars a millor actor (alfabètic). "
	echo "1.2 Mostrar històric d’Oscars a millor actriu (edat). "
	echo "1.3 Mostrar històric d’Oscars (actors/actrius). "

	read i 


	case $i in 

		1)	
		echo "Edat	Actor		Any	Pelicula"
		tail +2 oscar_age_male | sort -k 4 >> aux
		awk -F "\"*,\"*" '{print $4, $2, $3, $5}' aux
		rm aux
		;;
		2) 	
		echo "Actriu		Any	Edat	Pelicula"
		tail +2 oscar_age_female | sort -k 3 >> aux
		awk -F "\"*,\"*" '{print $4, $2, $3, $5}' aux
		rm aux
		;;
		3)	echo "Any	Actor/Actriu		Edat	Pelicula"
		tail +2 oscar_age_female | sort -k 2 >> aux
		tail +2 oscar_age_female | sort -k 2 >> aux
		sort -k 2 aux
		awk -F "\"*,\"*" '{print $2, $4, $3, $5}' aux
		rm aux
		;;
		*)
	
	esac;;

	2)
	echo "En desenvolupament"
	echo "---------------------------------------------------------------------------------------"
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
		   lin=`wc -l < oscar_age_male`
		   lin2=`wc -l < oscar_age_female`
		   while [ $i -lt $lin ]
		   do	
		   	head -$i oscar_age_male | tail -1 | grep $any > file1
		   	cat file1 >> file2
		   	let i=i+1		
		   done

		   while [ $j -lt $lin2 ]
		   do	
		   	head -$j oscar_age_female | tail -1 | grep $any > file1
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
		lin2=`wc -l < oscar_age_female`
		j=1
		#cut -d, -f3 oscar_age_female.csv | tr -d ' " ' >> camp

		while [ $j -lt $lin2 ]
		   do	
		   	head -$j oscar_age_female | tail -1 | sed 's/\"//g' | grep $nom | grep $cognom > file1
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
			  lin=`wc -l < oscar_age_male`
			  lin2=`wc -l < oscar_age_female`

			  while [ $i -lt $lin ]
				   do	
					   head -$i oscar_age_male | tail -1 | sed 's/\"//g' | grep "$peli" > file1
					   cat file1 >> file2
					   let i=i+1

				   done	  
				   numOscarsM=`wc -l < file2`

			   while [ $j -lt $lin ]
				   do	
					   head -$j oscar_age_female | tail -1 | sed 's/\"//g' | grep "$peli" > file1
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
	echo "-------------------------------------------------- "
	echo "                 Ets un Expert?"
	echo "-------------------------------------------------- "
	echo "3.1 Saps l’any que va guanyar l’Oscar ...? (1)"
	echo "3.2 Qui va guanyar l’Oscar a millor actor o actriu l’any ...? (2)"
	echo "3.3 Quina pel·lícula va guanyar l’Oscar a millor actor o actriu ...? (3)"

	read expert

	case $expert in
		1) 
		cat oscar_age_male >> aux
		cat oscar_age_female >> aux
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
		cat oscar_age_male  >> aux
		cat oscar_age_female >> aux
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
		cat oscar_age_male > aux
		cat oscar_age_female > aux

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
	;;


	4) echo "En desenvolupament"
	echo "--------------------------------------------------"
	echo "     Sistema Gestor de la Base de Dades" 
	echo "--------------------------------------------------"
	echo "4.1 Alta (1)"
	echo "4.2 Baixa (2)"
	echo "4.3 Modificació (3)"

	read sistema

	case $sistema in
		1) 

		echo "Vols afegir un actor o actriu"
		echo "1 - ACTOR" 
		echo "2 - ACTRIU" 
		read number 

		if [ $number -eq "1" ] 
		then 
		cat oscar_age_male > aux 
		else
		cat oscar_age_female > aux 
		fi
		
			
		echo "Escriu el nom de l’actor o actriu"
		read nom
		echo "Escriu l’any que l’actor o actriu va guanyar l’Oscar"
		read any
		echo "Escriu l’edat de l’actor o actriu quan va guanyar l’oscar"
		read edat
		echo "Escriu en quina pel·licula l’actor o actriu va guanyar l’Oscar"
		read pelicula

		#m=0
		#let m=$any-1927
		#if [ $m -le 0 ]
		#then
		#	m=1
		#fi
		lin=`wc -l < aux`
		
		m=0
		echo "0, 0" > file6
		while [ $m -lt $lin ]
		do
			head -$m aux | tail -1 | grep $any >> file6
			let m=m+1     
		done

		anyrepe=`cut -d, -f2 file6 | tail -1`

				       
		numindexfinal=`wc -l < aux`
		let index=$numindexfinal+1

		if [ $any == $anyrepe ]
		then 
			echo "Aquest any ja existeix"
			rm file6
		else
			echo "Aquest any no existeix"
			echo $index, $any, $edat, $nom, $pelicula > file1
			cat file1 >> aux
			sort -k2 -t, -n aux > aux2
			cat aux2
			if [ $number -eq "1" ]
			then
				cat aux2 > oscar_age_male
			else
				cat aux2 > oscar_age_female
			fi
		  rm aux
		  rm file1
		  rm aux2
		fi			
		
		;;
		
		2)
		echo "-----------------------------------------------------------"
		echo "Vols donar de baixa algun actor o actrius?"
		echo "1 - ACTOR"
		echo "2 - ACTRIU"

		read num

		if [ $num -eq "1" ]
		then
		    cat oscar_age_male > aux
		else    
		    cat oscar_age_female > aux
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

		#oscarany=0
		#let orscarany=$any-1927
		echo "Vols eliminar el registre del fitxer? S/N?" 
		read resposta

		if [ $resposta == "S" ] || [ $resposta == "s" ];
		then 
			echo "Suprimint..."
			#sed -i $oscarany file 2    
			#treballem el fitxer per borrar la linia corresponent
			awk -F, '$2 !~ /'"$any"'/ {print $0}' aux > aux2
			cat aux2
			if [ $num -eq "1" ]
			then
		  	  cat aux2 > oscar_age_male
			else    
		   	  cat aux2 > oscar_age_female
			fi    
		else 
			echo "No s'ha suprimit el registre"
		fi

		rm aux2
		rm file1
		rm aux;;
		
		3)	
		echo "Vols modifica la informació d'un actor o actriu?"
		echo "1 - ACTOR"
		echo "2 - ACTRIU"
		read OPCIO
		if [ $OPCIO -eq "1" ]
		then
			cat oscar_age_male > aux
		else	
			cat oscar_age_female > aux
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
		read nom2 cognom5
			if [ $nom2 == "=" ]
				then
				echo $nom > nomartista
				nom=`sed 's/\"//g' nomartista`
				#fem això per treure-li les cometes que té de sobres
				nom2=$nom	
				#Si l'usuari escriu un "=" llavors el nom final serà l'anterior
				rm nomartista
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
				rm nomartista			
			fi

			awk -F, '$2 !~ /'"$any"'/ {print $0}' aux > aux2
			#treballem el fitxer per borrar la linia corresponent

			echo $nom2 > nombre
			echo $peli2 > pelicu
			#posem el nom i la pelicul.la entre cometes
			nom3=`sed 's/^/"/;s/$/"/' nombre`
			peli3=`sed 's/^/"/;s/$/"/' pelicu`

			echo "$num, $any2," $edat2", $nom3, $peli3" > file4
			
		   	m=0
			echo "0, 0" > file6
			while [ $m -lt $lin ]
			do
			head -$m aux2 | tail -1 | grep $any2 >> file6
		      	  let m=m+1     
			done

			anyrepe=`cut -d, -f2 file6 | tail -1`
					
			echo $anyrepe
			echo $any2	
			
					
			if [ $any2 -eq $anyrepe ]
			then 
				echo "Aquest any ja existeix"
				cat aux > aux3
			else
			      echo "Registre editat"
			      cat file4 >> aux2
			      sort -k2 -t, -n aux2 > aux3
		       	cat aux3	
			fi
			
		if [ $OPCIO -eq "1" ] 
		then 
		 cat aux3 > oscar_age_male 
		else
		 cat aux3 > oscar_age_female 
		fi	

		#amb aquest if sabem si hem de classificar la informació entrada per	l'usuari
		rm file6 
		rm file1
		rm file4
		rm aux2
		rm aux3
		rm aux
		#rm fitxeru	   
		rm pelicu
		rm nombre
		;;
		*) ;;
		
	esac
		;;

	*) echo "Error, caràcter $opcio no vàlid"
	;;

	esac
	#clear

done
