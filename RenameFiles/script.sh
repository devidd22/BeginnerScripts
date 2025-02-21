#!/bin/bash
IFS=

while true; do

#primire director in care vom face modificarile
while true; do
echo "Introduceti calea inspre fisierul in care doriti sa faceti modificarile: "
read -r director
director="${director/#\~/$HOME}"
#verificare validitatea directorului primit
if [[ "$director" == "exit" ]]; then 
	echo "Va multumim ca ati folosit aplicatia noastra!"
	exit 1
fi
if [ -d "$director" ]; then 
	eval "cd $director"
	echo "Am intrat in directorul: $director"
	echo "Fisierele care se afla in acest director sunt: "
	ls
	break
else
	echo "Calea catre directorul introdus nu exista in sistemul nostru"
fi
done
while true; do
#citire modul in care vrem sa fie modificate 
echo "Prefix sau sufix?"
read -r raspuns_user
if [[ "$raspuns_user" == "prefix" || "$raspuns_user" == "sufix" ]]; then
	break
elif [[ "$raspuns_user" == "exit" ]]; then
	echo "Va multumim ca ati folosit aplicatia noastra!"
	exit 1
fi
echo "Trebuie sa introduceti 1 din cele 2 posibilitati"

done


while true; do
#citire fisierele pe care vrem sa le modificam
echo "Ce extensie vreti sa modificati?"
read -r extensie
if [[ "$extensie" == "director" ]]; then
	echo "Doriti sa schimbati directorul?"
	read -r -s -n 1 key
	if [[ "$key" == "" ]]; then
		echo "Directorul se va  modifica..."
		break
	else
		continue
	fi
elif [[ "$extensie" == "exit" ]]; then
	echo "Va multumim ca ati folosit aplicatia noastra!"
	exit 1
fi
nr=0
for f in *."$extensie"; do
	nr=$((nr+1))
done
if [[ "$nr" == 1 ]]; then
	echo "Nu exista o astfel de extensie in fisierul pe care doriti sa l modificati"
	echo "Incercati din nou"
	echo "Acestea sunt fisierele disponibile:"
	ls
else
	break
fi
done

if [[ "$extensie" == "director" ]]; then
	continue
else
#citire cum modificam fisierele
echo "Cu ce doriti sa modificam fisierul?"
read -r modificare

#modificarile fisierelor
if [[ "$raspuns_user" == "prefix" ]]; then
	for f in *."$extensie"; do
		mv "$f" "$modificare$f"	
	done
    ls
elif [[ "$raspuns_user" == "sufix" ]]; then
	for f in *."$extensie"; do
		#filepath="$director/
		mv "$f" "${f%.*}$modificare.$extensie"
	done
     ls
fi
fi
done
