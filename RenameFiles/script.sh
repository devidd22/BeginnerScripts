#!/bin/bash

#primire director in care vom face modificarile
echo "Introduceti fisierul in care doriti sa faceti modificarile: "
read -r director
director="${director/#\~/$HOME}"

#verificare validitatea directorului primit

if [ -d "$director" ]; then 
	eval "cd $director"
	echo "Am intrat in directorul: $director"
	echo "Fisierele care se afla in acest director sunt: "
	ls
else
	echo "Directorul introdus nu exista in sistemul nostru"
	exit 1
fi

#citire modul in care vrem sa fie modificate 
echo "Prefix sau sufix?"
read -r raspuns_user
echo "$raspuns_user"

#citire fisierele pe care vrem sa le modificam
echo "Ce extensie vreti sa modificati?"
read -r extensie
echo "$extensie"

#citire cum modificam fisierele
echo "Cu ce doriti sa modificam fisierul?"
read -r modificare
echo "$modificare"

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
