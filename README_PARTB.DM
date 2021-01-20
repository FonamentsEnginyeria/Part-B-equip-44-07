INFORME PART B: Fonaments d’Enginyeria:

Judit López Jiménez 1603591 
Adrià Martinez 1604086 
Èric Subirana 1603464

1.Descripció general del funcionament de la pràctica:

Un cop assolits els coneixements bàsics sobre el github i acabada la primera part de la pràctica, ens vam posar mans a l'obra a fer la part B d’aquesta pràctica. Ara que ja teníem una base de com funcionava la pràctica, aquest cop vam tenir la idea de  en comptes de posar-nos a fer codi de primeres, començar la pràctica en un drive per així planificar-la desde un primer moment, per tenir-ho tot més controlat i per no perdre el temps, ja que la comunicació entre els companys/es era vital per acabar aquesta pràctica amb èxit.
Aquesta part-B, constava de dos opcions amb tres tasques cada una d’elles.
Un cop executes el programa apareix un “Menú” que té com a funció imprimir per pantalla totes les possibles accions que pot fer el programa.
Començant, l’opció 1 té tres possibles tasques on cada una d’elles realitza una funció diferent, la primera tasca et busca un actor o actriu aleatòriament del fitxers corresponents i et mostra en pantalla tot el seu registre menys l’any, aquest any serà el que s’haurà d’endevinar perquè et feliciti el programa.
Per elaborar aquesta opció era molt important l’ús de comands com el wc, o el          ($RANDOM %) que en aquest cas ajuda a escollir un actor o actriu aleatòriament.
En canvi, en la segona opció aprofita aquest registre triat aleatoriament per preguntar-te quin és l’actor o actriu que va guanyar un oscar amb X pel·lícula.
Finalment la opció tres, ens demanava una estructura molt semblant a la de la segona opció, l’única diferència és que en aquest cas l’edat no és el que es pregunta, és la pel.lícula premiada. Era molt important tenir un domini mitjà del bash per poder realitzar aquesta opció, ja que havies d’utilitzar molts conceptes apresos durant les classes.
Canviant d’aires, en la segona opció se’ns plantejava un problema diferent als altres, un cop triada l’opció 2, surt un “Menú” que ens imprimeix per pantalla les tres tasques que podem el.laborar amb aquella opció. La primera tasca anomenada “Alta” et demana si vols afegir un actor o una actriu al fitxer corresponent, et demana el nom, l’edat… En el cas que hi hagi algun any que es repeteixi et mostrarà un missatge indicant que no s’ha pogut afegir el registre al fitxer, si l’any no es repeteix llavors afegeix el registre. En la segona tasca, et demana un any concret per el.liminar el registre que correspon aquell any, et demana confirmació.
Per acabar, la tasca número tres, demana un any a l’usuari i mostra per pantalla el registre que serà editat. Et demana que introdueixis el nou any, el nom i cognom, edat…, si vols que alguna informació d’aquest registre sigui igual al anterior només cal escriure un “=” i si es repeteix l’any et salta un error dient que no s’ha pogut editar el registre, en canvi si l’any no està repetit serà introduït en el fitxer corresponent. 
Pel que fa el tema script, ha sigut més complicat que en la part-A ja que els codis de cada opció han sigut més extensos i amb més comandes del habitual. Hem hagut de cercar algunes comandes per internet, inclús mirar algún video de youtube que ens mostrés com utilitzar-la.
 

2.Descripció dels problemes sorgits durant la realització de la pràctica i les solucions aplicades:

En l’elaboració del programa vam tenir uns quants problemes que comentarem a continuació.
Desde un bon principi ja sabiem que tindriem problemes amb el github ja que encara no estem habituats a ell, tot i tenir una base sempre hi han coses que no ens queden clares i cal repassar-les. Un dels grans problemes que vam tenir van ser les branques degut a que en vam crear una de més que més tard vam tinguer que el.liminar. 
Pel que fa tema script, va ser complicat buscar formes de solucionar algun apartat com per exemple el de que si l’usuari posava un “=” la part d’aquell registre havia de ser com l’anterior, però amb una gran dedicació i esforç es van aconseguir els objectius proposats desde un bon principi.
Un dels grans problemes va ser l’utilització de nous comandes com la del “RANDOM” per exemple que ens va causar alguns problemes en un principi.
Com que aquest cop vam tenir que anar avançant la pràctica durant dies festius va ser complicat trobar un horari adequat entre els tres integrants del grups, però parlant ens vam posar d’acord en posar-nos ni que fos unes tres hores setmanals on tots podiem participar.
Van sorgir alguns altres petits problemes que vam anar assolint a mesura que passava el temps i que no els hi vam donar gaire importància ja que com he esmentat anteriorment teniem alguns de més importants.
Tot hi haver passat per tants problemes creiem que ha sigut un èxit la manera que hem tingut de comunicar-nos i solucionar tot allò que se’ns possava d’entre mig..

3.Explicació de com executar el codi del repositori:

Per poder executar el programa principal hem utilitzat la comanda bash. Una vegada comença l’execució del script, l’executor es troba amb les comandes source que truquen a determinats arxius on es troben les funcions que s’executaran depenent de l’elecció del menu mostrat per pantalla. Per executar el codi repositori hem d'escriure el següent: → ./oscar.sh
Si veiem que ens salta un error, llavors necessitem donar-li el permís per poder executar-lo: 
-chmod 744 o chmod g+x.
Un cop escrita aquesta comanda ja podem executar el codi.


4.Llista de les comandes utilitzades en la pràctica amb una breu explicació de què fa cadascuna d’elles

git init: Aquesta comanda es fa servir per crear un nou repertori GIT
git status: Aquesta comanda mostra la llista dels arxius que han canviat juntament amb els arxius que estan per ser afegits o compromesos.
git push: Un simple push envia els canvis que s'han fet en la branca principal dels repertoris remots que estan associats amb el directori que està treballant.
git branch: Aquesta comanda es fa servir per llistar, crear o esborrar branques.
git pull: S’utilitza per poder fusionar tots els canvis que s'han fet en el repositori local treballant
git merge: Aquesta comanda es fa servir per fusionar una branca amb una altra branca activa.
git log: En executar aquesta comanda es mostra una llista de commits en una branca juntament amb tots els detalls.
git commit: la comanda commit és utilitzada per canviar a la capçalera. 
git remote: Aquesta comanda ens permet gestionar els repositoris “remots” amb els que treballem.
grep: mostra per pantalla les línies del fitxer que continguin el patró de cerca.
sort: mostra per pantalla el contingut del fitxer ordenat.
cut: comanda per extreure segments de qualsevol fitxer, treballa a partir de “columnes”.
wc: “word count” pot fer diferentes enumeracions, ja siguin paraules “wc -w”, línies “wc -l” o caràcters “wc -c” d’un fitxer.
head: mostra les primeres línies d’un fitxer.
tail: mostra les últimes línies d’un fitxer.
sed 's/\"//g': comanda utilitzada per treure les comilles (“) d’abans i darrere del nom.
echo: comanda que s’encarrega d’escriure cada string donat.
$(( $RANDOM %)): comanda que selecciona de forma aleatoria x cosa d'un fitxer qualsevol


5.Conclusions

L’objectiu principal de la pràctica era adquirir coneixements de com funciona la part del github, tot i que el principi ens resultava impossible comprendre les comandes i com enviar-nos la informació corresponent, poc a poc vam anar cercant informació ja fos per internet o preguntant per gmail als professors de com solucionar alguns problemes i vam poder anar progressant d’una forma lenta però eficaç.
Aquesta pràctica ens ha ajudat molt per familiaritzar-nos amb l’entorn git i poder treballar en grup fàcilment. Aprendre a utilitzar el github va ser una gran experiència i molt útil degut a que estem segurs que en un futur no molt llunyà haurem d’utilitzar-lo ja sigui per la finalitat de fer més pràctiques o treballar en grup. Ara que ja tenim assolit un mínim coneixement del “git” podrem treballar conjuntament amb diferents persones utilitzant diferents dispositius, aquest fet ens dona molta comoditat a l’hora de treballar i també eficàcia degut a que no perdem tant temps. Ens hem trobat amb diversos problemes que ja hem esmentat en altres parts del treball que no sabiem com solucionar pero ajudant-nos entre nosaltres han pogut ser resolts.
En conclusió hem assolit tots els objectius principals que teníem desde un bon inici, com per exemple començar a dominar la creació de scripts en sistemes operatius i desenvolupar un treball la qual era necessari saber manipular dades i gestionar fitxers.

