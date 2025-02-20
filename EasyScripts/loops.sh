#!/bin/bash

#citire un numar si sa afisam suma de la 1..n

#rugam user ul sa introduca un Numar N
echo "Scrie N"
#citire N
read N
suma=0
for((i=0;i<=$N;i++)); do
	suma=$((suma + i))
done
echo "Suma este: $suma"
