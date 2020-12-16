Judit López Jiménez 1603591 Adrià Martinez 1604086 Eric Subirana 1603464

INFORME

Descripció general del funcionament de la pràctica-------------------------------------------------------------------------------

En aquesta pràctica hem elaborat un programa entre els tres integrants del grup, el qual et permet cercar i ordenar els actors i actrius guanyadors d’oscars d’una base de dades. El programa consta de tres parts dividides en tres branques, les quals en aquestes hem desenvolupat diferents scripts de “bash”, el menu, la opció 1 i la opció 2, on cada part desenvolupa una funció determinada. El executable “Menú” fa la funció d’imprimir per pantalla el menú introductor del nostre programa i que mostri la opció escollida per l’usuari. En segon lloc, tenim l’opció 1 què és un altre script on un cop seleccionada aquesta opció, sortirà un menú amb un format que ens han esmentat prèviament. Els objectius principals de l’opció 1 eren dominar la comanda “sort”, ja que en la primera part ens demanaven organitzar els actors segons els oscars que tenien, en la segona part mostrar l’històric d’oscars a millor actriu ordenades per l’edat i finalment el mateix amb la tercera part, però aquest cas segons l’any en comptes de l’edat. També era important dominar la comanda “cut” degut a que més tard era necessària per col·locar totes les característiques dels actors i actrius necessàries en una taula ben ordenada. En canvi en la segona opció no era tan important el domini del sort, ja que es centrava més en buscar una solució concreta, per aquesta raó era important l’ús de la comanda “grep” per exemple. Un cop seleccionada la segona opció apareix un menú on apareixen tres tasques diferents. A la primera tasca, s’havia de buscar l’actor i l’actriu que van obtenir un Oscar en un any concret, pel que fa a la segona, havíem de fer un programa on escrivint un nom d’una actriu, et digués l’edat que tenia…. I en definitiva, en la tasca 3 hem hagut de fer un programa que demana una pel·lícula a l’usuari i un cop escrita aquesta pel·lícula et proporcioni un llistat d’Oscars a millor actor o actriu que ha obtingut certa pel·lícula.

Un cop explicat el tema script de la pràctica un dels principals conceptes a adquirir era l’ús del git, com que érem uns inexperts, la primera pràctica es va fer a clase, en aquesta sessió vam tenir que escollir un capità/na el qual seria el creador del grup dintre de la plataforma git. El professor ens va ensenyar a com obtenir un repositori remot privat que ens permetia treballar i aportar totes les tasques desde dispositius diferents. Llavors el capità o capitana de l’equip havia de seguir uns passos que un cop finalitzats, els membres del grup que no eren capitans havien de clonar el repositori remot.

A l’hora d’enviar-nos els script, el principi se’ns feia molt difícil degut a que no teníem molt clar quines comandes de git havíem d’utilitzar. Poc a poc ens vam anar familiaritzant amb elles fins arribar a un punt que ho fèiem tot mecanicament.

Descripció dels problemes sorgits durant la realització de la pràctica i les solucions aplicades----------------------------------------------

En l'elaboració del programa i organització de les branques amb “github” han sorgit diversos problemes que hem anat solucionant a mesura que avançàvem a la pràctica. Un dels primers problemes que se’ns van presentar va ser la correcta utilització del “git”, no sabíem ordenar correctament les diferents branques i desenvolupar les diferents opcions a la branca corresponent amb el seu “commit”. Aquest problema era degut a la poca experiència que teniem amb el repositori de “github”, però a mesura que feiem la pràctica anàvem entenent més encara el seu funcionament i a poder utilitzar-lo de la forma més eficient. A causa d’aquest problema i un malentès amb la pràctica vam haver de refer la pràctica des de zero. Va haver-hi fins i tot una mica de caos el primer dia que vam fer la classe amb el professor degut a que érem molta gent i tots estàvem intentant descobrir el funcionament correcte de github. Un altre dels principals problemes que ens van sorgir va ser el desenvolupament dels “scripts”, però amb la col·laboració dels integrants del grup vam poder solucionar-los sense gaires complicacions. Sortint del tema ordinador, ens va resultar difícil trobar alguna hora en la qual tots poguéssim estar connectats a la vegada, ja que les hores que vam tenir de pràctica no van ser suficients per acabar-la. Finalment, ens vam posar d’acord per treballar amb la pràctica a una hora determinada. Com a últim punt, va ser un petit problema el desconeixement d’algunes comandes importants. Aquestes van ajudar a finalitzar el nostre projecte de forma neta i sense cap imprevist, com poden ser commandes per borrar “commits” o el funcionament de les branques amb github, com per exemple ‘git reset + codi del commit’ o ‘git push origin’, entre altres. En la resta de la pràctica van sorgir problemes mínims, que amb la ajuda d’algun company o alguna cerca als apunts es van solucionar sense dificultats.

Explicació de com executar el codi del repositori-------------------------------------------------------------------------

Per poder executar el programa principal hem utilitzat la comanda bash. Una vegada comença l’execució del script, l’executor es troba amb les comandes source que truquen a determinats arxius on es troben les funcions que s’executaran depenent de l’elecció del menu mostrat per pantalla. Per executar el codi repositori hem d'escriure el següent: ./oscar.sh Si veiem que ens salta un error, llavors necessitem donar-li el permís per poder executar-lo: -chmod 744 o chmod g+x. Un cop escrita aquesta comanda ja podem executar el codi.

Llista de les comandes utilitzades en la pràctica amb una breu explicació de què fa cadascuna d’elles-----------------------------------------

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

sed 's/"//g': comanda utilitzada per treure les comilles (“) d’abans i darrere del nom.

echo: comanda que s’encarrega d’escriure cada string donat.

Conclusions--------------------------------------------------------------------------------------------------------

L’objectiu principal de la pràctica era adquirir coneixements de com funciona la part del github, tot i que el principi ens resultava impossible comprendre les comandes i com enviar-nos la informació corresponent, poc a poc vam anar cercant informació ja fos per internet o preguntant per gmail als professors de com solucionar alguns problemes i vam poder anar progressant d’una forma lenta però eficaç.

Aquesta pràctica ens ha ajudat molt per familiaritzar-nos amb l’entorn git i poder treballar en grup fàcilment. Aprendre a utilitzar el github va ser una gran experiència i molt útil degut a que estem segurs que en un futur no molt llunyà haurem d’utilitzar-lo ja sigui per la finalitat de fer més pràctiques o treballar en grup. Ara que ja tenim assolit un mínim coneixement del “git” podrem treballar conjuntament amb diferents persones utilitzant diferents dispositius, aquest fet ens dona molta comoditat a l’hora de treballar i també eficàcia degut a que no perdem tant temps. Ens hem trobat amb diversos problemes que ja hem esmentat en altres parts del treball que no sabiem com solucionar pero ajudant-nos entre nosaltres han pogut ser resolts.

En conclusió hem assolit tots els objectius principals que teníem desde un bon inici, com per exemple començar a dominar la creació de scripts en sistemes operatius i desenvolupar un treball la qual era necessari saber manipular dades i gestionar fitxers.
