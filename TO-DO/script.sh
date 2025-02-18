#!/bin/bash
filename="todo.txt"
shellcheck "$0"


while true; do
read -r comanda
if [[ "$comanda" == "listare" ]]; then
	less "$filename"
	echo "Introduceti una dintre comenzile: listare, add, delete, exit."
elif [[ "$comanda" == "add" ]]; then
	echo "Intoduceti ceea ce doriti sa adaugati"
	read -r comanda
	echo "$comanda" >> "$filename"
	echo "Introduceti una dintre comenzile: listare, add, delete, exit."
elif [[ "$comanda" == "delete" ]]; then
	echo "Introduceti ceea ce doriti sa stergeti"
	read -r comanda
	cod=0
	while read -r p; do
		if [[ "$comanda" == "$p" ]]; then
			cod=1
			break
		fi
	done<"$filename"
	if [[ "$cod" == 0 ]]; then
		sed -i.bak "/^$comanda$/d" "$filename"
		#verificam daca s-a reusit stergerea
		if [[ $? -eq 0 ]]; then
                    echo "Task-ul pe care l-ati intodus s-a sters cu succes!"
	        fi
		echo "Introduceti una dintre comenzile: listare, add, delete, exit."
	else
          echo "Task-ul pe care l-ati introdus nu a fost gasit, va rog verificati daca ati scris o comanda valida"
	  echo "Introduceti una dintre comenzile: listare, add, delete, exit."
	fi

elif [[ "$comanda" == "exit" ]]; then 
	echo "Iesire din aplicatie"
	echo "Introduceti una dintre comenzile: listare, add, delete, exit."
	break
else 
	echo "Nu exista aceasta comanda"
	echo "Introduceti una dintre comenzile: listare, add, delete, exit."
fi
done
