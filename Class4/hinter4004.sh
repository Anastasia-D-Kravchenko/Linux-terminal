#!/bin/bash

start() {
  echo '    _   _   _'
  echo '   / \ / \ / \'
  echo '  ( S | O | P )'
  echo '   \_/ \_/ \_/  _     _   _   _   _     _   _   _   _'
  echo '   / \ / \ / \ / \   / \ / \ / \ / \   / \ / \ / \ / \'
  echo '  ( B | A | S | H ) ( T | a | s | k ) ( 4 | 0 | 0 | 4 )'
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
  echo "Teraz trochę inne zadanie, a dokładniej mówiąc dwa zadania. Napisz dwa skrypty. Pierwszy z nich, nazwijmy go wifi-collector, będzie zbierał (imitował zbieranie) danych o natężeniu sygnału sieci wifi w danym miejscu. Dane te zapisze do pliku i operację tę będzie okresowo powtarzał . Dane z tego pliku będzie pobierał wifi-presenter i przedstawiał je na tekstowym wykresie słupkowym. Oba skrypty mają działać w nieskończoność. Jak wifi-collector nie udostępnił danych to wifi-presenter ma czekać na dane. Format przekazywanych danych oraz sposób ich prezentacji pokazałem poniżej."
  echo 
  echo "Now a slightly different task, or more precisely, two tasks. Write two scripts. The first one, let's call it wifi-collector, will collect (imitate collecting) data about the intensity of the wifi network signal in a given place. It will write this data to a file and this operation will be repeated periodically . The data from this file will be taken by the wifi-presenter and presented on a text bar graph. Both scripts are supposed to run indefinitely. As wifi-collector didn't provide data then wifi-presenter is supposed to wait for data. I have shown below the format of the transferred data and how it is presented."
  echo "--------------------------"
  echo 
  echo "Data produced by collector     ->     Data visualised by presenter"
  echo "----------------------------------------------------------------"
  echo "WiFi-room1 14                         WiFi-room1 **************"
  echo "WiFi-room2 4                          WiFi-room2 ****"
  echo "Wifi-room3 0                          Wifi-room3"
  echo "Wifi-room4 8                          Wifi-room4 ********"
  echo "Wifi-Orange 0                         Wifi-Orange"
  echo "Wifi-speed 3                          Wifi-speed ***"
  echo "Wifi-Castle 5                         Wifi-Castle *****"
  echo ""
  echo ""
  echo "|"
  echo ""
  echo ""
  echo ""
  echo ""
  echo ""
  echo ""
  echo ""
}

my_clear() {
  clear
}


hint1() {
  printf "Jak wynika z treści zadania, skrypt wifi-collector zapisuje wygenerowane dane do pliku, a z pliku są odczytywane przez wifi-presentera i wyświetlane na konsoli w postaci tekstowego wykresu.\nAs you can see from the task, the wifi-collector script writes the generated data to a file, and from the file it is read by the wifi-presenter and displayed on the console in the form of such a text graph.\n"
}

hint2() {
  printf "Swoje rozwiązanie jak zwykle oparłem o podprogramy - to bardzo ułatwia i systematyzuje pracę, czyni kod łatwy w zrozumieniu.\nI based my solution, as usual, on subroutines - this makes the work very easy and systematic, makes the code easy to understand\n"
}

hint3() {
  printf "W pierwszej kolejności przejrzyjmy kod wifi-collectora. Jest to prymitywny symulator i oczywiście nie pobiera danych z żadnych sensorów (chociaż by mógł) tylko generuje liczby losowe i je zapisuje do pliku.\nFirst, let's review the code of the wifi-collector. This is a primitive simulator, and of course it doesn't take data from any sensors (although it could) just generates random numbers and writes them to a file.\n"
}

hint4() {
  printf "1 #!/bin/bash\n2 ...\n52 ...\n53 \n54 WIFI=\"WiFi-room1,WiFi-room2,Wifi-room3,Wifi-room4,Wifi-Orange,Wifi-speed,Wifi-Castle\"\n55 \n56 hashmap_initialization 5\n57 \n58 while true ; do\n59   read_data_from_wifi_sensors_fake\n60   lock\n61   print_wifi_strength > /tmp/wifi_tmp\$\$\n62   unlock\n63   sleep 0.1\n64 done\n65 \n66 exit 0\n"
}

hint5() {
  printf "To nasz główny program, ciało skryptu. Widzimy tutaj nazwy prezentowanych sieci wifi, a także inicjalizujemy hashmapę wartością domyślną 5.\nThis is our main program, the body of the script. Here we see the names of the presented wifi networks, and we initialize the hashmap with the default value of 5.\n"
}

hint6() {
  printf "Cała praca wifi-collectora wykonywana jest w pętli nieskończonej, w której co 0.1 sekundy odczytuje dane z sensorów i zapisuje je do pliku. Sam zapis wymaga wprowadzenia synchronizacji: wifi-prsenter nie powinien odczytywać pliku wynikowego, zanim wifi-collctor poprawnie go nie utoworzy. Mamy tutaj pośredni lik wynikowy ma nazwę wifi_tmp\$\$, który znajduje się w katalogu /tmp. Co to jest \$\$? Jest to numer pidu bieżącego skryptu. Dopiero po porawnym utworzeniu, ten plik zostanie udostępniony dla presentera. Zaraz sprawdzimy jak to się odbywa.\nAll of the wifi-collector's work is done in an infinite loop, in which every 0.1 seconds it reads data from the sensors and writes it to a file. The writing itself requires the introduction of synchronization: the wifi-presenter should not read the result file before the wifi-collector properly creates it. Here we have an intermediate result lycle has the name wifi_tmp\$\$, which is located in the /tmp directory. What is \$\$? It is the pid number of the current script. Only after correct creation, this file will be made available to the wifi-presenter. We will check how this is done in a moment.\n"
}

hint7() {
  printf "1 #!/bin/bash\n2 \n3 hput() {\n4   HASH=\"\$1F\$(echo \$2 | tr '-' 'T')\"\n5   eval \"\$HASH\"=\"\$3\"\n6 }\n7 \n8 hget() {\n9   HASH=\"\$1F\$(echo \$2 | tr '-' 'T')\"\n10   echo \${!HASH}\n11 }\n12 \n13 hashmap_initialization(){\n14   IFS=\$','\n15   I=1\n16   for NET in \$(echo \"\$WIFI\"); do\n17     hput nets \"\$NET\" \"\$1\"\n18     let I++\n19   done\n20 }\n21 \n22 ...\n54 ...\n55 \n56 hashmap_initialization 5\n57 \n58 ...\n"
}

hint8() {
  printf "To jest oczywiście standardowa, znana nam już obsługa hashmapy. Nie jest ona tutaj niezbędna, ale wykorzystałem ten kod z jednego z poprzednich zadań.\nThis is, of course, the standard hashmap support we already know. It is not essential here, but I used this code from one of the previous tasks.\n"
}

hint9() {
  printf "21 ...\n22 read_data_from_wifi_sensors_fake(){\n23   IFS=\$','\n24   for NET in \$(echo \"\$WIFI\"); do\n25       PREV_STRANGTH=\$(hget nets \"\$NET\")\n26       DATA_FROM_SENSOR=\"\$RANDOM\"\n27       let CHANGE_STRANGTH=DATA_FROM_SENSOR%%20-10\n28       let CURRENT_STRENGTH=PREV_STRANGTH+CHANGE_STRANGTH\n29       if [ \"\$CURRENT_STRENGTH\" -gt 80 ] ; then\n30          CURRENT_STRENGTH=80\n31       elif [ \"\$CURRENT_STRENGTH\" -lt 0 ] ; then\n32           CURRENT_STRENGTH=0\n33       fi\n34       hput nets \"\$NET\" \"\$CURRENT_STRENGTH\"\n35   done\n36 }\n37 \n38 ...\n57 ...\n58 while true ; do\n59   read_data_from_wifi_sensors_fake\n60 ...\n"
}

hint10() {
  printf "Udawany odczyt z sensorów to po prostu pętla po wszystkich obsługiwanych sieciach i wylosowanie pewnej zmiany względem sygnału bieżącego. Jeżeli wyznaczona wartość przekracza zakres [0,80] to zostaje on zredukowany, albo do 0 albo do 80.\nA fake sensor reading is simply a loop through all the supported networks and generate some random change from the current signal. If the determined value exceeds the range [0,80] then it is reduced, either to 0 or 80.\n"
}

hint11() {
  printf "36 ...\n37 \n38 print_wifi_strength(){\n39   IFS=\$','\n40   for NET in \$(echo \"\$WIFI\"); do\n41     printf \"%%s %%d\\\n\"  \"\$NET\" \$(hget intervals \"\$NET\")\n42   done\n43 }\n44 \n45 ...\n57 ...\n58 while true ; do\n59 ...\n60 ...\n61   print_wifi_strength > /tmp/wifi_tmp\$\$\n62 ...\n63 ...\n64 done\n65 ...\n"
}

hint12() {
  printf "Sam wydruk zebranych danych nie wymaga specjalnego tłumaczenia. Dla każdej sieci wifi pobieramy dane z hashmapy i przekazujemy je na standardowe wyjście, z którego potem zostaną zapisane do pliku tymczasowego /tmp/wifi_tmp\$\$.\nThe printing of the collected data itself requires no special explanation. For each wifi network, we take the data from the hashmap and pass it to the standard output, from which it will then be written to the temporary file /tmp/wifi_tmp\$\$.\n"
}

hint13() {
  printf "43 ...\n44 \n45 lock() {\n46   while [ -e /tmp/current_wifi_data ] ; do sleep 0.1; done;\n47 }\n48 \n49 unlock(){\n50   cat /tmp/wifi_tmp\$\$\n51   cat /tmp/wifi_tmp\$\$ > /tmp/current_wifi_data\n52 }\n53 \n54 ...\n57 ...\n58 while true ; do\n59 ...\n59 ...\n60   lock\n61   print_wifi_strength > /tmp/wifi_tmp\$\$\n62   unlock\n63 ...\n63 ...\n64 done\n65 ...\n"
}

hint14() {
  printf "Paru słów wyjaśnienia wymagają podprogramy lock i unlock. Podprogram lock wywołujemy przed drukowaniem danych do pliku tymczasowego. Co on właściwie robi? Implementuje on tak zwane aktywne czekanie. Wykonuje pętlę dopóki istnieje poprzednio zapisany plik /tmp/current_wifi_data. Jeżeli plik ten istnieje to znaczy, że wifi-presenter go z jakichś powodów nie odczytał. Jak wifi-presenter odczyta zawartość pliku to ją zwizualizuje, a plik skasuje. Jest to ustalona, wewnętrzna polityka synchronizacyjna między tymi dwoma skryptami.\nA few words of explanation are required for the lock and unlock subroutines. We call the lock subroutine before printing data to a temporary file. What does it actually do? It implements the so-called active wait. It executes a loop as long as the previously saved file /tmp/current_wifi_data exists. If this file exists, it means that the wifi-presenter did not read it for some reason. As the wifi-presenter reads the contents of the file it visualizes it, and deletes the file. This is an established internal synchronization policy between the two scripts.\n"
}

hint15() {
  printf "1 #!/bin/bash\n2 \n3 hput() {\n4   HASH=\"\$1F\$(echo \$2 | tr '-' 'T')\"\n5   eval \"\$HASH\"=\"\$3\"\n6 }\n7 \n8 hget() {\n9   HASH=\"\$1F\$(echo \$2 | tr '-' 'T')\"\n10   echo \${!HASH}\n11 }\n12 \n13 hashmap_initialization(){\n14   IFS=\$','\n15   I=1\n16   for NET in \$(echo \"\$WIFI\"); do\n17     hput nets \"\$NET\" \"\$1\"\n18     let I++\n19   done\n20 }\n21 \n22 read_data_from_wifi_sensors_fake(){\n23   IFS=\$','\n24   for NET in \$(echo \"\$WIFI\"); do\n25       PREV_STRANGTH=\$(hget nets \"\$NET\")\n26       DATA_FROM_SENSOR=\"\$RANDOM\"\n27       let CHANGE_STRANGTH=DATA_FROM_SENSOR%%20-10\n28       let CURRENT_STRENGTH=PREV_STRANGTH+CHANGE_STRANGTH\n29       if [ \"\$CURRENT_STRENGTH\" -gt 80 ] ; then\n30          CURRENT_STRENGTH=80\n31       elif [ \"\$CURRENT_STRENGTH\" -lt 0 ] ; then\n32           CURRENT_STRENGTH=0\n33       fi\n34       hput nets \"\$NET\" \"\$CURRENT_STRENGTH\"\n35   done\n36 }\n37 \n38 print_wifi_strength(){\n39   IFS=\$','\n40   for NET in \$(echo \"\$WIFI\"); do\n41     printf \"%%s %%d\\\n\"  \"\$NET\" \$(hget intervals \"\$NET\")\n42   done\n43 }\n44 \n45 lock() {\n46   while [ -e /tmp/current_wifi_data ] ; do sleep 0.1; done;\n47 }\n48 \n49 unlock(){\n50   cat /tmp/wifi_tmp\$\$\n51   cat /tmp/wifi_tmp\$\$ > /tmp/current_wifi_data\n52 }\n53 \n54 WIFI=\"WiFi-room1,WiFi-room2,Wifi-room3,Wifi-room4,Wifi-Orange,Wifi-speed,Wifi-Castle\"\n55 \n56 hashmap_initialization 5\n57 \n58 while true ; do\n59   read_data_from_wifi_sensors_fake\n60   lock\n61   print_wifi_strength > /tmp/wifi_tmp\$\$\n62   unlock\n63   sleep 0.1\n64 done\n65 \n66 exit 0\n"
}

hint16() {
  printf "To jest właśnie kompletny kod skryptu wifi-collectora. Czas na wifi-presentera.\nThis is the complete code of the wifi-collector script. Time for the wifi-presenter.\n"
}

hint17() {
  printf "1 #!/bin/bash\n2 ...\n53 ...\n54 \n55 MAX_SIGNAL_STRENGTH=80\n56 clear;\n57 \n58 while true ; do\n59   lock\n60   create_panel_with_rows\n61   magic\n62   windmill\n63   print_panel\n64   unlock\n65   wait_a_bit\n66 done\n67 \n68 exit 0\n"
}

hint18() {
  printf "Tutaj też zapisałem to w postaci podprogramów. Wydruk będzie odbywał się w panelu o określonej długości. Zakładamy, że maksymalna długość wskaźnika siły sygnału to 80. Kasujemy ekran i podobnie jak poprzednio skrypt wykonuje operację odświeżenia ekranu o ile zostaną przesłane dane od wifi-collectora.\nHere I have also written it in the form of subroutines. Printing will be done in a panel of a certain length. We assume that the maximum length of the signal strength indicator is 80. We erase the screen and, as before, the script performs the operation of refreshing the screen as long as the data from the wifi-collector is transmitted.\n"
}

hint19() {
  printf "23 ...\n24 lock(){\n25   while [ ! -e /tmp/current_wifi_data  ] ; do sleep 0.1; done;\n26 }\n27 \n28 unlock(){\n29   rm -rf /tmp/current_wifi_data\n30 }\n31 ...\n57 ...\n58 while true ; do\n59   lock\n60 ...\n63 ...\n64   unlock\n65   wait_a_bit\n66 done\n67 ...\n"
}

hint20() {
  printf "Tym razem zacznę od wytłumaczenia działania funkcji lock i unlock. Działają one inaczej niż poprzednio, ale są z nimi spójne. Wifi-presenter czaka na aktualne dane od wifi-collectora. Funkcja lock wstrzymuje prezentację dopóki nie pojawią się bieżące dane od wifi-collectora. Natomiast podprogram unlock kasuje plik z właśnie zaprezentowanymi danymi. Jest to sygnał dla wifi-collectora, że może udostępnić nowe dane do prezentacji.\nThis time I'll start by explaining how the lock and unlock functions work. They work differently than before, but are consistent with them. The wifi-presenter is waiting for current data from the wifi-collector. The lock function pauses the presentation until the current data from the wifi-collector appears. The unlock subroutine, on the other hand, deletes the file with the just-presented data. This is a signal to the wifi-collector that it can make new data available for presentation.\n"
}

hint21() {
  printf "1 ...\n2 \n3 create_row() {\n4   local L=\"\$1\"\n5   local W=\"\$2\"\n6   [ \"\$L\" -gt \"\$W\" ] && L=\"\$W\"\n7   local ROW=\"\"\n8   for((i=0;i<L;i++)) ; do ROW=\"\$ROW\"'*'; done\n9   for((j=i;j<W;j++)) ; do ROW=\"\$ROW\"' '; done\n10   echo \"\$ROW\"\n11 }\n12 ...\n36 ...\n37 create_panel_with_rows(){\n38   IFS=\$'\\\n'\n39   for LINE in \$(cat /tmp/current_wifi_data) ; do\n40     WIFI=\$(echo \"\$LINE\" | cut -d' ' -f1)\n41     LENGTH=\$(echo \"\$LINE\" | cut -d' ' -f2)\n42     ROW=\$(create_row \"\$LENGTH\" \"\$MAX_SIGNAL_STRENGTH\")\n43     printf \"%%20s %%s\\\n\" \"WIFI\" \"\$ROW\"\n44   done > panel\n45 }\n46 ...\n57 ...\n58 while true ; do\n59   lock\n60   create_panel_with_rows\n61 ...\n63 ...\n64   unlock\n65   wait_a_bit\n66 done\n67 ...\n"
}

hint22() {
  printf "Teraz tworzymy panel z wykresem tekstowym. Technicznie jest to dość prosta operacja. Po uzyskaniu dostępu do pliku z danymi, odczytujemy dane  linia po linii. Z każdej linii pobieramy informację o nazwie sieci i sile sygnału. Następnie formatujemy wiersz i wszystko zapisujemy do pliku o nazwie panel.\nNow we create a panel with a text chart. Technically, this is a fairly simple operation. After accessing the data file, we read the data line by line. From each line we take information about the network name and signal strength. Then we format the line and save everything to a file named panel.\n"
}

hint23() {
  printf "12 ...\n13 windmill(){\n14   [ -z \"\$K\" ] && K=0\n15   case \"\$K\" in\n16    \"0\") echo \"-\" ;;\n17    \"1\") echo \"\\\\\" ;;\n18    \"2\") echo \"|\" ;;\n19    \"3\") echo \"/\" ;;\n20   esac\n21   let K=(K+1)%%4\n22 }\n23 ...\n31 ...\n32 magic(){\n33 # clear\n34  echo -en \"\\\033[;0H\"\n35 }\n36 ...\n46 ...\n47 print_panel(){\n48   cat panel\n49 }\n50 \n51 wait_a_bit(){\n52   sleep 0.1\n53 }\n54 ...\n57 ...\n58 while true ; do\n59   lock\n60   create_panel_with_rows\n61   magic\n62   windmill\n63   print_panel\n64   unlock\n65   wait_a_bit\n66 done\n67 ...\n"
}

hint24() {
  printf "No i mamy praktycznie całego wifi-presentera. Podprogram print_panel wyświetla zawartość plik panel, który zawiera sformatowane bieżące dane. Podprogram windmill generuje coś w rodzaju wiatraka. W lewym górnym rogu będzie się kręcił tekstowy wiatrak. Podprogramu wait_a_bit nie muszę chyba tłumaczyć. Wytłumaczenia wymaga natomiast niby prosty podprogram magic. Składa się on z wywołania albo polecenia clear albo echo. Jak wiadomo polecenie clear kasuje zawartość ekranu, abyśmy mogli wyświetlić cały nasz wykres. A co robi wywołanie echo? Domyśleć się jest bardzo ciężko, ale właśnie w tym wypadku sama prezentacja wygląda dużo lepiej niż przy wywołaniu clear. Poszukaj w Internecie co tam się właściwie dzieje.\nWell, and we have practically the whole wifi-presenter. The print_panel subroutine displays the contents of the panel file, which contains the formatted current data. The windmill subroutine generates something like a windmill. A text windmill will spin in the upper left corner. The wait_a_bit subroutine probably doesn't need to be explained. However, the seemingly simple magic subroutine requires explanation. It consists of a call to either the clear or echo command. As you know, the clear command deletes the contents of the screen so that we can display our entire chart. And what does the echo call do? It is very hard to guess, but this is where the presentation itself looks much better than with the clear call. Look on the Internet for what actually happens there.\n"
}

hint25() {
  printf "1 #!/bin/bash\n2 \n3 create_row() {\n4   local L=\"\$1\"\n5   local W=\"\$2\"\n6   [ \"\$L\" -gt \"\$W\" ] && L=\"\$W\"\n7   local ROW=\"\"\n8   for((i=0;i<L;i++)) ; do ROW=\"\$ROW\"'*'; done\n9   for((j=i;j<W;j++)) ; do ROW=\"\$ROW\"' '; done\n10   echo \"\$ROW\"\n11 }\n12 \n13 windmill(){\n14   [ -z \"\$K\" ] && K=0\n15   case \"\$K\" in\n16    \"0\") echo \"-\" ;;\n17    \"1\") echo \"\\\\\" ;;\n18    \"2\") echo \"|\" ;;\n19    \"3\") echo \"/\" ;;\n20   esac\n21   let K=(K+1)%%4\n22 }\n23 \n24 lock(){\n25   while [ ! -e /tmp/current_wifi_data  ] ; do sleep 0.1; done;\n26 }\n27 \n28 unlock(){\n29   rm -rf /tmp/current_wifi_data\n30 }\n31 \n32 magic(){\n33 # clear\n34  echo -en \"\\\033[;0H\"\n35 }\n36 \n37 create_panel_with_rows(){\n38   IFS=\$'\\\n'\n39   for LINE in \$(cat /tmp/current_wifi_data) ; do\n40     WIFI=\$(echo \"\$LINE\" | cut -d' ' -f1)\n41     LENGTH=\$(echo \"\$LINE\" | cut -d' ' -f2)\n42     ROW=\$(create_row \"\$LENGTH\" \"\$MAX_SIGNAL_STRENGTH\")\n43     printf \"%%20s %%s\\\n\" \"WIFI\" \"\$ROW\"\n44   done > panel\n45 }\n46 \n47 print_panel(){\n48   cat panel\n49 }\n50 \n51 wait_a_bit(){\n52   sleep 0.1\n53 }\n54 \n55 MAX_SIGNAL_STRENGTH=80\n56 clear;\n57 \n58 while true ; do\n59   lock\n60   create_panel_with_rows\n61   magic\n62   windmill\n63   print_panel\n64   unlock\n65   wait_a_bit\n66 done\n67 \n68 exit 0\n"
}

hint26() {
  printf "To jest właśnie kompletny kod skryptu wifi-presenter.\nThis is the complete code of the wifi-presenter script\n"
}

solution() {
  printf "1 #!/bin/bash\n2 \n3 hput() {\n4   HASH=\"\$1F\$(echo \$2 | tr '-' 'T')\"\n5   eval \"\$HASH\"=\"\$3\"\n6 }\n7 \n8 hget() {\n9   HASH=\"\$1F\$(echo \$2 | tr '-' 'T')\"\n10   echo \${!HASH}\n11 }\n12 \n13 hashmap_initialization(){\n14   IFS=\$','\n15   I=1\n16   for NET in \$(echo \"\$WIFI\"); do\n17     hput nets \"\$NET\" \"\$1\"\n18     let I++\n19   done\n20 }\n21 \n22 read_data_from_wifi_sensors_fake(){\n23   IFS=\$','\n24   for NET in \$(echo \"\$WIFI\"); do\n25       PREV_STRANGTH=\$(hget nets \"\$NET\")\n26       DATA_FROM_SENSOR=\"\$RANDOM\"\n27       let CHANGE_STRANGTH=DATA_FROM_SENSOR%%20-10\n28       let CURRENT_STRENGTH=PREV_STRANGTH+CHANGE_STRANGTH\n29       if [ \"\$CURRENT_STRENGTH\" -gt 80 ] ; then\n30          CURRENT_STRENGTH=80\n31       elif [ \"\$CURRENT_STRENGTH\" -lt 0 ] ; then\n32           CURRENT_STRENGTH=0\n33       fi\n34       hput nets \"\$NET\" \"\$CURRENT_STRENGTH\"\n35   done\n36 }\n37 \n38 print_wifi_strength(){\n39   IFS=\$','\n40   for NET in \$(echo \"\$WIFI\"); do\n41     printf \"%%s %%d\\\n\"  \"\$NET\" \$(hget intervals \"\$NET\")\n42   done\n43 }\n44 \n45 lock() {\n46   while [ -e /tmp/current_wifi_data ] ; do sleep 0.1; done;\n47 }\n48 \n49 unlock(){\n50   cat /tmp/wifi_tmp\$\$\n51   cat /tmp/wifi_tmp\$\$ > /tmp/current_wifi_data\n52 }\n53 \n54 WIFI=\"WiFi-room1,WiFi-room2,Wifi-room3,Wifi-room4,Wifi-Orange,Wifi-speed,Wifi-Castle\"\n55 \n56 hashmap_initialization 5\n57 \n58 while true ; do\n59   read_data_from_wifi_sensors_fake\n60   lock\n61   print_wifi_strength > /tmp/wifi_tmp\$\$\n62   unlock\n63   sleep 0.1\n64 done\n65 \n66 exit 0\n1 #!/bin/bash\n2 \n3 create_row() {\n4   local L=\"\$1\"\n5   local W=\"\$2\"\n6   [ \"\$L\" -gt \"\$W\" ] && L=\"\$W\"\n7   local ROW=\"\"\n8   for((i=0;i<L;i++)) ; do ROW=\"\$ROW\"'*'; done\n9   for((j=i;j<W;j++)) ; do ROW=\"\$ROW\"' '; done\n10   echo \"\$ROW\"\n11 }\n12 \n13 windmill(){\n14   [ -z \"\$K\" ] && K=0\n15   case \"\$K\" in\n16    \"0\") echo \"-\" ;;\n17    \"1\") echo \"\\\\\" ;;\n18    \"2\") echo \"|\" ;;\n19    \"3\") echo \"/\" ;;\n20   esac\n21   let K=(K+1)%%4\n22 }\n23 \n24 lock(){\n25   while [ ! -e /tmp/current_wifi_data  ] ; do sleep 0.1; done;\n26 }\n27 \n28 unlock(){\n29   rm -rf /tmp/current_wifi_data\n30 }\n31 \n32 magic(){\n33 # clear\n34  echo -en \"\\\033[;0H\"\n35 }\n36 \n37 create_panel_with_rows(){\n38   IFS=\$'\\\n'\n39   for LINE in \$(cat /tmp/current_wifi_data) ; do\n40     WIFI=\$(echo \"\$LINE\" | cut -d' ' -f1)\n41     LENGTH=\$(echo \"\$LINE\" | cut -d' ' -f2)\n42     ROW=\$(create_row \"\$LENGTH\" \"\$MAX_SIGNAL_STRENGTH\")\n43     printf \"%%20s %%s\\\n\" \"WIFI\" \"\$ROW\"\n44   done > panel\n45 }\n46 \n47 print_panel(){\n48   cat panel\n49 }\n50 \n51 wait_a_bit(){\n52   sleep 0.1\n53 }\n54 \n55 MAX_SIGNAL_STRENGTH=80\n56 clear;\n57 \n58 while true ; do\n59   lock\n60   create_panel_with_rows\n61   magic\n62   windmill\n63   print_panel\n64   unlock\n65   wait_a_bit\n66 done\n67 \n68 exit 0\n"
}



homework1() {
  printf "Praca domowa #4004_1: Rozszerz działanie wi-fi presentera tak aby na końcu każdego wskaźnika była wyświetlona wartość procentowa względem wartości 80. Czyli jak wskaźnik wyświetla wartość 39 to powinniśmy wyświetlić się tekst 48,75%%.\nHomework #4004_1: Extend the operation of the wi-fi presenter so that at the end of each indicator is displayed a percentage value against the value of 80. That is, as the indicator displays the value 39, we should display the text 48.75%%.\n"
}

homework2() {
  printf "Praca domowa #4004_2: Zmień działanie wifi-presentera tak aby sam wykres wyświetla się nie od lewej strony, ale od prawej.\nHomework #4004_2: Change the operation of the wifi-presenter so that the graph itself displays not from the left, but from the right.\n"
}

homework3() {
  printf "Praca domowa #4004_3: Jak kilka osób w tym samym czasie, będzie uruchamiać te skrypty, może nie działać to poprawnie. Dlaczego? Wszyscy korzystają z tych samych plików w tym samym czasie. Popraw to aby takich kolizji uniknąć.\nHomework #4004_3: As several people at the same time, will run these scripts, it may not work properly. Why? They all use the same files at the same time. Fix this to avoid such collisions.\n"
}

homework4() {
  printf "Praca domowa #4004_4: Wprowadzamy zmianę w wifi-collectorze. Oprócz siły sygnału, udostępnia on dodatkowe informacje: numer kanału danej sieci wifi, oraz aktualną maksymalną przepustowością. Zmodyfikuj nasz plik oraz wprowadź nowy sposób wizualizacji - kolejny wykres, na którym przedstawisz przepustowość. Sposób przedstawienia numeru kanału pozostawiam Tobie.\nHomework #4004_4: We make a change to the wifi-collector. In addition to signal strength, it provides additional information: the channel number of a given wifi network, and the current maximum throughput. Modify our file and introduce a new way of visualization - another graph to represent the throughput. I leave the way of presenting the channel number to you.\n"
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

menu 'start' 'content' 'hint1' 'hint2' 'hint3' 'hint4' 'hint5' 'hint6' 'hint7' 'hint8' 'hint9' 'hint10' 'hint11' 'hint12' 'hint13' 'hint14' 'hint15' 'hint16' 'hint17' 'hint18' 'hint19' 'hint20' 'hint21' 'hint22' 'hint23' 'hint24' 'hint25' 'hint26' 'solution' 'homework1' 'homework2' 'homework3' 'homework4' 

exit 0