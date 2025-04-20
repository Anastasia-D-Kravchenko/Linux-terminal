#!/bin/bash

start() {
  echo '    _   _   _'
  echo '   / \ / \ / \'
  echo '  ( S | O | P )'
  echo '   \_/ \_/ \_/  _     _   _   _   _     _   _   _   _'
  echo '   / \ / \ / \ / \   / \ / \ / \ / \   / \ / \ / \ / \'
  echo '  ( B | A | S | H ) ( T | a | s | k ) ( 4 | 0 | 0 | 3 )'
  echo '   \_/ \_/ \_/ \_/   \_/ \_/ \_/ \_/   \_/ \_/ \_/ \_/'
  echo '   / \ / \ / \ / \   / \ / \ / \ / \'
  echo '  ( A | d | a | m ) ( S | m | y | k )'
  echo '   \_/ \_/ \_/ \_/   \_/ \_/ \_/ \_/      _   _   _   _'
  echo '   / \ / \ / \ / \ / \ / \ / \ / \ / \   / \ / \ / \ / \'
  echo '  ( C | o | p | y | r | i | g | h | t ) ( 2 | 0 | 2 | 4 )'
  echo '   \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/   \_/ \_/ \_/ \_/'
  echo ''
  echo '[Q - quit] [<> Prev Next hint] [ Up Down Scroll hint]'
}

content() {
  echo "--------------------------"
  echo 
  echo "Napisz skrypt, który wyznaczy statystykę (histogram) rozmiaru plików dla wskazanego katalogu. Skrypt przyjmuje informacje o klasie rozmiaru pliku w postaci: 0-100,200-2000,3000-4000.  W tym przypadku mamy trzy klasy. Do pierwszej klasy należą pliki małe od 0B do 100B, do kolejnej od 200B do 2000B i do ostatniej pliki od 3000B do 4000B."
  echo 
  echo "Write a script that calculates file size statistics (histogram) for the specified directory. The script takes file size class information in the form: 0-100,200-2000,3000-4000. In this case, we have three classes. The first class includes small files from 0B to 100B, the next class includes files from 200B to 2000B and the last class includes files from 3000B to 4000B."
  echo "--------------------------"
  echo 
  echo ""
  echo "HISTOGRAM EXAMPLE FOR DIRECTORY /bin"
  echo ""
  echo "asmyk@msh:~$ ./histogram.sh  /bin"
  echo "Histogram for directory: /bin"
  echo "|  File size class |  Number of files |"
  echo "|            0-100 |               28 |"
  echo "|          100-200 |                2 |"
  echo "|          200-300 |                0 |"
  echo "|          300-400 |                0 |"
  echo "|          400-500 |                0 |"
  echo "|          500-600 |                0 |"
  echo "|          600-700 |                0 |"
  echo "|          700-800 |                0 |"
  echo "|          800-900 |                0 |"
  echo "|         900-1000 |                1 |"
  echo "|       1000-10000 |               18 |"
  echo "| 10000-1000000000 |              122 |"
  echo "asmyk@msh:~$"
}

my_clear() {
  clear
}


hint1() {
  printf "Zadanie wygląda na proste, ale uczulam, że raportowanie danych to bardzo trudne zadanie. Czasami nie da się tego łatwo napisać, dochodzą do tego również problemy wydajnościowe. Ale spróbujemy.\nThe task looks simple, but I sensitize you that data reporting is a very difficult task. Sometimes it can't be written easily, and there are also performance problems. But we will try.\n"
}

hint2() {
  printf "Swoje rozwiązanie oparłem o podprogramy - to bardzo ułatwia i systematyzuje pracę.\nI based my solution on subroutines - this makes work very easy and systematic.\n"
}

hint3() {
  printf "1 #!/bin/bash\n2 ...\n58 ...\n59 \n60 [ ! \$# -ne 1 ] && exit 1\n61 \n62 DIRECTORY=\"\$1\"\n63 [ ! -d \"\$DIRECTORY\" ] && [ ! -r \"\$DIRECTORY\" ] && exit 2\n64 \n65 INTERVALS=\"0-1000,1000-2000,2000-3000,10000-1000000000\"\n66 FROM=()\n67 TO=()\n68 \n69 intervals_preprocessing\n70 collect_histogram \"\$DIRECTORY\"\n71 print_histogram\n72 \n73 exit 0\n"
}

hint4() {
  printf "Na samym początku sprawdzamy czy mamy dokładnie jeden argument, czy jest to katalog do odczytu.\nTo begin with, we check that we have exactly one argument, whether it is a readable directory.\n"
}

hint5() {
  printf "Następnie definiujemy interesujące nas zakresy rozmiaru plików, a także dwie tablice FROM i TO, które będą przechowywać informacje o zakresach w postaci wstępnie przetworzonej.\nNext, we define the file size ranges of interest, as well as two arrays FROM and TO, which will store information about the ranges in preprocessed form.\n"
}

hint6() {
  printf "W liniach 69-71 wywołujemy trzy podprogramy. Pierwszy z nich wstępnie przetwarza dane dotyczące przekazanych zakresów. Drugi z nich wykonuje statystykę, a trzeci wyświetla wynik.\nIn lines 69-71 we call three subroutines. The first one preprocesses the data on the ranges passed. The second one performs the statistics, and the third one displays the result.\n"
}

hint7() {
  printf "Nasz histogram będzie przechowywany w hashmapie. Wbrew pozorom taką strukturę implementuje się bardzo łatwo w takim języku jak bash. Pokażę przykład.\nOur histogram will be stored in a hashmap. Despite appearances, such a structure is implemented very easily in a language such as bash. I will show an example.\n"
}

hint8() {
  printf "1 #!/bin/bash\n2 \n3 hput() {\n4   HASH=\"\$1F\$(echo \$2 | tr '-' 'T')\"\n5   eval \"\$HASH\"=\"\$3\"\n6 }\n7 \n8 hget() {\n9   HASH=\"\$1F\$(echo \$2 | tr '-' 'T')\"\n10   echo \${!HASH}\n11 }\n12 ...\n27 ...\n28     hput intervals \"\$INT\" 0\n29 ...\n41 ...\n42       VALUE=\$(hget intervals \"\$INTERVAL\")\n43 ...\n"
}

hint9() {
  printf "Jak widać, cała implementacja hashmapy to dwa podprogramy (sam pomysł wziąłem z Internetu, ale nie wiem kto jest jego rzeczywistym autorem): hget i hput. Pierwsza z nich wstawia dane do hashmapy, a druga pobiera. Sama implementacja jest bardzo prosta (może czasami niebezpieczna) i opiera się na tym, że w bashu w dowolnym momencie możemy utworzyć zmienną o dowolnej nazwie i zmienna ta będzie pojedynczą komórką mojej bitmapy. Aby odwołać się do tej komórki musimy znać hash, a ten musimy sobie wyliczyć na podstawie danych generowanych przez aplikację.\nAs you can see, the entire hashmap implementation is two subroutines (I took the idea myself from the Internet, but I don't know who the actual author is): hget and hput. The former inserts data into the hashmap, and the latter retrieves it. The implementation itself is very simple (maybe sometimes dangerous) and is based on the fact that in bash at any time we can create a variable with any name and this variable will be a single cell of my bitmap. To refer to this cell we need to know the hash, and this hash must be calculated for ourselves based on the data generated by the application.\n"
}

hint10() {
  printf "Pozostawiam Wam analizę, w jaki sposób ja wyliczam tego hasha. Czego używam do wykonania tej operacji i jak to przetwarzam.\nI leave it to you to analyze how I calculate this hash. What I use to perform this operation and how I process it.\n"
}

hint11() {
  printf "Wytłumaczenia wymagają dwa elementy: polecenie eval i \${!..}. Oba z nich przypominają trochę operacje refleksji z jezyka JAVA. Funkcja eval wykonuje polecenie przy czym jak widzimy w tym przykładzie nazwa tworzonej zmiennej jest wygenerowana dynamicznie na podstawie zmiennej HASH i do tej zmiennej przypisana jest wartość trzeciego argumentu. Operator \${! } w sposób dynamiczny daje nam dostęp do wartości zmiennej, której nazwa jest zapisana w innej zmiennej. Trochę to skomplikowane, a tłumaczenie jest dość uproszczone, ale zapewniam, że tak jest.\nThere are two elements that need explanation: the eval command and \${!..}. Both of them are somewhat reminiscent of reflection operations from the JAVA language. The eval function executes the command, and as we can see in this example, the name of the variable to be created is generated dynamically based on the HASH variable, and the value of the third argument is assigned to this variable. The operator \${! } dynamically gives us access to the value of a variable whose name is stored in another variable. It's a bit complicated, and the translation is quite simplistic, but I assure you that it is.\n"
}

hint12() {
  printf "Dodanie i uzyskanie dostępu do elementu z hashmapy jest bardzo proste. Czym jest jednak tekst intervals, który widzimy przy wywołaniach. Jest to nasza nazwa hashmapy, gdyż wyliczanie hasha wykorzystuje ta nazwę i inne parametry. Jak będziemy chcieli wstawić tą samą wartość do innej hashmapy to wystarczy zmienić tę nazwę i zostanie wygenerowany inny hash. Prawda, że proste.\nAdding and accessing an element from the hashmap is very simple. However, what is the intervals text that we see when calling. This is our hashmap name, as the hash calculation uses this name and other parameters. As we want to insert the same value in another hashmap, we just need to change this name and a different hash will be generated. Simple truth.\n"
}

hint13() {
  printf "22 ...\n23 \n24 intervals_preprocessing(){\n25   IFS=\$','\n26   I=1\n27   for INT in \$(echo \"\$INTERVALS\"); do\n28     hput intervals \"\$INT\" 0\n29     FROM[I]=\$(echo \$INT | cut -d'-' -f1)\n30     TO[I]=\$(echo \$INT | cut -d'-' -f2)\n31     let I++\n32   done\n33 }\n34 \n35 ...\n64 ...\n65 INTERVALS=\"0-1000,1000-2000,2000-3000,10000-1000000000\"\n66 FROM=()\n67 TO=()\n68 \n69 intervals_preprocessing\n70 ...\n"
}

hint14() {
  printf "Podprogram intervals_preprocessing wstępnie przetwarza interwały wprowadzone przez użytkownika. Wstawia interwały do hashmapy, a  odpowiednie wartości początek interwału i koniec wstawia do tablic FROM i TO. Taki zabieg przyspieszy przetwarzanie. Nie wytłumaczę, ale poszukaj odpowiedzi samodzielnie: do czego służy zmienna IFS i dlaczego została zainicjalizowana przecinkiem.\nThe intervals_preprocessing subroutine preprocesses the intervals entered by the user. It inserts the intervals into the hashmap, and inserts the corresponding interval start and end values into the FROM and TO arrays. Such a procedure will speed up processing. I won't explain, but look for the answer yourself: what the IFS variable is used for and why it is initialized with a comma.\n"
}

hint15() {
  printf "34 ...\n35 collect_histogram(){\n36   IFS=\$'\\\n'\n37   for F in \$(ls \"\$1\") ; do\n38     if [ -f \"\$1/\$F\" ] ; then\n39       SIZE=\$(stat -c%%s \"\$1/\$F\")\n40       INTERVAL=\$(find_interval \"\$SIZE\")\n41       [ -z \"\$INTERVAL\" ] && continue\n42       VALUE=\$(hget intervals \"\$INTERVAL\")\n43       [ -z \"\$VALUE\" ] && continue\n44       let VALUE++\n45       hput intervals \"\$INTERVAL\" \"\$VALUE\"\n46     fi\n47   done\n48 }\n49 ...\n69 ...\n70 collect_histogram \"\$DIRECTORY\"\n71 ...\n"
}

hint16() {
  printf "Podprogram collect_histogram pobiera nazwę przetwarzanego katalogu i przechodzi po wszystkich elementach z danego katalogu. Jeżeli ten element jest plikiem to używając polecenia stat poznajemy jego rozmiar. Mając rozmiar, wyznaczamy szukamy odpowiedniego interwału, do którego ten rozmiar może być zakwalifikowany. Tę oparację wykonuje podprogram find_interval. Jeżeli klasyfikacja przebiegła prawidłowo, dla danego interwału pobieramy wartość hashmapy (pamiętaj, że wstępnie dla wszystkich interwałów wstawiliśmy tam zera). Jak udało się na pobrać wartość, to zwiększamy ją o jeden i zapisujemy wynik do hashmapy. I to generalnie wszystko.\nThe collect_histogram subroutine takes the name of the directory being processed and goes through all the elements in the directory. If that item is a file then using the stat command we learn its size. Having the size, we determine the search for a suitable interval to which this size can be qualified. This pairing is performed by the find_interval subroutine. If the classification went correctly, we retrieve the hashmap value for the interval (remember, we initially inserted zeros there for all intervals). As we managed to retrieve the value, we increase it by one and write the result to the hashmap. And that's generally all.\n"
}

hint17() {
  printf "12 ...\n13 find_interval() {\n14   VALUE=\"\$1\"\n15   IFS=\$','\n16   for((i=1;i<=\${#TO[@]};i++)); do\n17     if  [ \"\${FROM[i]}\" -le \"\$VALUE\" -a \"\$VALUE\" -le  \"\${TO[i]}\" ] ; then\n18       echo \"\${FROM[i]}-\${TO[i]}\"\n19       return 0\n20     fi\n21   done\n22 }\n23 ...\n39 ...\n40       INTERVAL=\$(find_interval \"\$SIZE\")\n41 ...\n"
}

hint18() {
  printf "Analizę podprogramu find_interval pozostawiam Tobie. Myślę, że nie ma tutaj nic trudnego, co najwyżej trochę zawiłości wprowadzonych przez basha, które już powinieneś znać. Aha, a jak poznać rozmiar tablicy w bashu?\nI leave the analysis of the find_interval subroutine to you. I think there is nothing difficult here, at most some intricacies introduced by bash, which you should already know. Oh, and how to know the size of an array in bash?\n"
}

hint19() {
  printf "49 ...\n50 print_histogram(){\n51   printf \"%%s\" \"Histogram for directory: \$DIRECTORY\"\n52   printf \"| %%16s | %%16s |\\\n\"  \"File size class\" \"Number of files\"\n53 \n54   IFS=\$','\n55   for INT in \$(echo \"\$INTERVALS\"); do\n56     printf \"| %%16s | %%16d |\\\n\" \$INT \$(hget intervals \"\$INT\")\n57   done\n58 }\n59 ...\n70 ...\n71 print_histogram\n72 \n73 exit 0\n"
}

hint20() {
  printf "Ostatni podprogram print_histogram, jak sama nazwa wskazuje, wypisuje naszą hashmapę na konsoli. Używamy tutaj polecenia printf, które jest swego rodzaju wzorcem wykorzystywanym do formatowania sposobu wyświetlania tekstów zmiennych itp. Warto jest ją znać. Widzimy znowu zmienną IFS. No i fundament tego podprogramu, czyli pętla for, przechodząca po wszystkich elementach tekstu INTERVALS. Uwaga elementem jest ciąg znaków oddzielony od innego ciągu znakiem ze zmiennej IFS.\nThe last subroutine print_histogram, as the name suggests, prints out our hashmap on the console. Here we use the printf command, which is a kind of pattern used to format how to display the texts of variables, etc. It's worth knowing it. We see the IFS variable again. Well, and the foundation of this subroutine, which is a for loop, going through all the elements of the INTERVALS text. Note an element is a string separated from another string by a character from the IFS variable.\n"
}

hint21() {
  printf "No i teraz cały kompletny skypt.\nWell, and now the whole complete skypt.\n"
}

hint22() {
  printf "1 #!/bin/bash\n2 \n3 hput() {\n4   HASH=\"\$1F\$(echo \$2 | tr '-' 'T')\"\n5   eval \"\$HASH\"=\"\$3\"\n6 }\n7 \n8 hget() {\n9   HASH=\"\$1F\$(echo \$2 | tr '-' 'T')\"\n10   echo \${!HASH}\n11 }\n12 \n13 find_interval() {\n14   VALUE=\"\$1\"\n15   IFS=\$','\n16   for((i=1;i<=\${#TO[@]};i++)); do\n17     if  [ \"\${FROM[i]}\" -le \"\$VALUE\" -a \"\$VALUE\" -le  \"\${TO[i]}\" ] ; then\n18       echo \"\${FROM[i]}-\${TO[i]}\"\n19       return 0\n20     fi\n21   done\n22 }\n23 \n24 intervals_preprocessing(){\n25   IFS=\$','\n26   I=1\n27   for INT in \$(echo \"\$INTERVALS\"); do\n28     hput intervals \"\$INT\" 0\n29     FROM[I]=\$(echo \$INT | cut -d'-' -f1)\n30     TO[I]=\$(echo \$INT | cut -d'-' -f2)\n31     let I++\n32   done\n33 }\n34 \n35 collect_histogram(){\n36   IFS=\$'\\\n'\n37   for F in \$(ls \"\$1\") ; do\n38     if [ -f \"\$1/\$F\" ] ; then\n39       SIZE=\$(stat -c%%s \"\$1/\$F\")\n40       INTERVAL=\$(find_interval \"\$SIZE\")\n41       [ -z \"\$INTERVAL\" ] && continue\n42       VALUE=\$(hget intervals \"\$INTERVAL\")\n43       [ -z \"\$VALUE\" ] && continue\n44       let VALUE++\n45       hput intervals \"\$INTERVAL\" \"\$VALUE\"\n46     fi\n47   done\n48 }\n49 \n50 print_histogram(){\n51   printf \"%%s\" \"Histogram for directory: \$DIRECTORY\"\n52   printf \"| %%16s | %%16s |\\\n\"  \"File size class\" \"Number of files\"\n53 \n54   IFS=\$','\n55   for INT in \$(echo \"\$INTERVALS\"); do\n56     printf \"| %%16s | %%16d |\\\n\" \$INT \$(hget intervals \"\$INT\")\n57   done\n58 }\n59 \n60 [ ! \$# -ne 1 ] && exit 1\n61 \n62 DIRECTORY=\"\$1\"\n63 [ ! -d \"\$DIRECTORY\" ] && [ ! -r \"\$DIRECTORY\" ] && exit 2\n64 \n65 INTERVALS=\"0-1000,1000-2000,2000-3000,10000-1000000000\"\n66 FROM=()\n67 TO=()\n68 \n69 intervals_preprocessing\n70 collect_histogram \"\$DIRECTORY\"\n71 print_histogram\n72 \n73 exit 0\n"
}

solution() {
  printf "1 #!/bin/bash\n2 \n3 hput() {\n4   HASH=\"\$1F\$(echo \$2 | tr '-' 'T')\"\n5   eval \"\$HASH\"=\"\$3\"\n6 }\n7 \n8 hget() {\n9   HASH=\"\$1F\$(echo \$2 | tr '-' 'T')\"\n10   echo \${!HASH}\n11 }\n12 \n13 find_interval() {\n14   VALUE=\"\$1\"\n15   IFS=\$','\n16   for((i=1;i<=\${#TO[@]};i++)); do\n17     if  [ \"\${FROM[i]}\" -le \"\$VALUE\" -a \"\$VALUE\" -le  \"\${TO[i]}\" ] ; then\n18       echo \"\${FROM[i]}-\${TO[i]}\"\n19       return 0\n20     fi\n21   done\n22 }\n23 \n24 intervals_preprocessing(){\n25   IFS=\$','\n26   I=1\n27   for INT in \$(echo \"\$INTERVALS\"); do\n28     hput intervals \"\$INT\" 0\n29     FROM[I]=\$(echo \$INT | cut -d'-' -f1)\n30     TO[I]=\$(echo \$INT | cut -d'-' -f2)\n31     let I++\n32   done\n33 }\n34 \n35 collect_histogram(){\n36   IFS=\$'\\\n'\n37   for F in \$(ls \"\$1\") ; do\n38     if [ -f \"\$1/\$F\" ] ; then\n39       SIZE=\$(stat -c%%s \"\$1/\$F\")\n40       INTERVAL=\$(find_interval \"\$SIZE\")\n41       [ -z \"\$INTERVAL\" ] && continue\n42       VALUE=\$(hget intervals \"\$INTERVAL\")\n43       [ -z \"\$VALUE\" ] && continue\n44       let VALUE++\n45       hput intervals \"\$INTERVAL\" \"\$VALUE\"\n46     fi\n47   done\n48 }\n49 \n50 print_histogram(){\n51   printf \"%%s\" \"Histogram for directory: \$DIRECTORY\"\n52   printf \"| %%16s | %%16s |\\\n\"  \"File size class\" \"Number of files\"\n53 \n54   IFS=\$','\n55   for INT in \$(echo \"\$INTERVALS\"); do\n56     printf \"| %%16s | %%16d |\\\n\" \$INT \$(hget intervals \"\$INT\")\n57   done\n58 }\n59 \n60 [ ! \$# -ne 1 ] && exit 1\n61 \n62 DIRECTORY=\"\$1\"\n63 [ ! -d \"\$DIRECTORY\" ] && [ ! -r \"\$DIRECTORY\" ] && exit 2\n64 \n65 INTERVALS=\"0-1000,1000-2000,2000-3000,10000-1000000000\"\n66 FROM=()\n67 TO=()\n68 \n69 intervals_preprocessing\n70 collect_histogram \"\$DIRECTORY\"\n71 print_histogram\n72 \n73 exit 0\n"
}



homework1() {
  printf "Praca domowa #4003_1: Rozszerz działanie naszego skryptu, aby przetwarzał wiele katalogów.\nHomework #4003_1: Extend the operation of our script to process multiple directories.\n"
}

homework2() {
  printf "Praca domowa #4003_2: Dodaj informację ile czasu zajęło skryptowi wykonanie tej operacji, ile czasu średnio przetwarzał jeden plik. Zbadaj, który z podprogramów, która operacja zajmuje najwięcej czasu. Może da się to jakoś zoptymalizować, przepisać.\nHomework #4003_2: Add information about how long it took the script to perform this operation, how long it took on average to process one file. Investigate which subroutine, which operation takes the most time. Maybe it can be optimized somehow, rewritten.\n"
}

homework3() {
  printf "Praca domowa #4003_3: Przenieś interwały z ciała skrytpu do pliku konfiguracyjnego i odczytaj je przed rozpoczęciem tworzenia histogramu.\nHomework #4003_3: Transfer the intervals from the scrip body to the configuration file and read them before starting to create the histogram.\n"
}

homework4() {
  printf "Praca domowa #4003_4: Dodaj informacje, ile procentowo zajmują pliki w każdym interwale.\nHomework #4003_4: Add information on what percentage of files are occupied in each interval.\n"
}

menu() {
  SELECTED_ITEM=0
  FROM=1
  HEIGHT=30
  STEP=1
  MENU_ITEMS=($@)
  HINTS=${#MENU_ITEMS[@]}
  let HINTS=HINTS-2

  clear
  echo "${MENU_ITEMS[$SELECTED_ITEM]}"
  ${MENU_ITEMS[$SELECTED_ITEM]} $((FROM+HEIGHT)) $HEIGHT

  while read -rsn1 INPUT ; do
    #clear
    case "$INPUT" in
      $'\x1B')
	      read -rsn1 -t 0.1 INPUT
	      if [ "$INPUT" = "[" ] ;then
	        read -rsn1 -t 0.1 INPUT
	      #  echo $INPUT
	        REFRESH=0
	        case "$INPUT" in
		        A) let FROM-=STEP; REFRESH=1 ;; #UP
		        B) let FROM+=STEP; REFRESH=1 ;; #DOWN
		        5) let FROM-=HEIGHT; REFRESH=1 ;; #PAGEUP
		        6) let FROM+=HEIGHT; REFRESH=1 ;; #PAGEDOWN
		        C) let SELECTED_ITEM++ ; let FROM=0; REFRESH=1 ;; #RIGHT
		        D) let SELECTED_ITEM-- ; let FROM=0; REFRESH=1 ;; #LEFT
		        Q) exit 0; ;;
      	  esac
	        if [ $SELECTED_ITEM -lt 0 ] ; then
	          let  SELECTED_ITEM=0
	        fi
	        if [ $SELECTED_ITEM -ge ${#MENU_ITEMS[@]} ] ; then
	          let SELECTED_ITEM=${#MENU_ITEMS[@]}-1
	        fi
	        if [ $FROM -lt 0 ] ; then
	          let FROM=0
	        fi
	        SIZE_Y=$(${MENU_ITEMS[$SELECTED_ITEM]} | wc  -l)
	        if [ $((FROM+HEIGHT)) -gt $SIZE_Y ] ; then
	          let FROM=SIZE_Y-HEIGHT
   	      fi
   	      if [ "$REFRESH" = '0' ] ; then
   	        continue
   	      else
   	        clear
   	      fi
	       # echo -n "$((FROM+HEIGHT))  $SIZE_Y  "
	        if [[  "${MENU_ITEMS[$SELECTED_ITEM]}" =~ ^hint ]] ; then
	          echo "${MENU_ITEMS[$SELECTED_ITEM]}/$HINTS"
	        else
	          echo "${MENU_ITEMS[$SELECTED_ITEM]}"
	        fi
	        ${MENU_ITEMS[$SELECTED_ITEM]} |  head -n $((FROM+HEIGHT)) | tail -n $HEIGHT
        fi
	      read -rsn5 -t 0.1 ;;
	   q) break ;;
	   *) echo -n ;;
    esac
  done
}

menu 'start' 'content' 'hint1' 'hint2' 'hint3' 'hint4' 'hint5' 'hint6' 'hint7' 'hint8' 'hint9' 'hint10' 'hint11' 'hint12' 'hint13' 'hint14' 'hint15' 'hint16' 'hint17' 'hint18' 'hint19' 'hint20' 'hint21' 'hint22' 'solution' 'homework1' 'homework2' 'homework3' 'homework4' 

exit 0