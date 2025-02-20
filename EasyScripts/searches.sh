#!/bin/bash

echo "Introduce numele pe care vrei sa il cauti"
read cuvant
echo "Introduce numele fisierului in care vrei sa cauti"
read fisier
numara=$(grep -o -w "$cuvant" "$fisier" | wc -l)
echo "Cuvantul $cuvant apare de $numara in fisierul: $fisier"
