#!/bin/bash

# Ejemplo 1: Búsqueda de cadenas con 'sed'
echo "Ejemplo 1: Búsqueda de cadenas con 'sed'"
echo "Texto de ejemplo: Este es un ejemplo de búsqueda de cadena con sed." > ejemplo.txt

# Búsqueda de la palabra 'ejemplo' y muestra la línea encontrada en un archivo
sed '/ejemplo/p' ejemplo.txt > resultado_ejemplo1.txt
cat resultado_ejemplo1.txt

# Separador de ejemplos
echo "------------------------------------------------------------"

# Ejemplo 2: Sustitución de patrones con 'sed'
echo "Ejemplo 2: Sustitución de patrones con 'sed'"
echo "Texto de ejemplo: Sustituir palabra1 por palabra2." > ejemplo2.txt

# Sustituye 'palabra1' por 'palabra2' en la línea y muestra el resultado en un archivo
sed 's/palabra1/palabra2/' ejemplo2.txt > resultado_ejemplo2.txt
cat resultado_ejemplo2.txt

# Separador de ejemplos
echo "------------------------------------------------------------"

# Ejemplo 3: Borrado de líneas con 'sed'
echo "Ejemplo 3: Borrado de líneas con 'sed'"
echo "Texto de ejemplo:" > ejemplo3.txt
echo "Línea 1: Esta línea se mantendrá." >> ejemplo3.txt
echo "Línea 2: Esta línea será borrada." >> ejemplo3.txt

# Borra la línea que contiene 'borrada' y muestra el resultado en un archivo
sed '/borrada/d' ejemplo3.txt > resultado_ejemplo3.txt
cat resultado_ejemplo3.txt

# Separador de ejemplos
echo "------------------------------------------------------------"

# Ejemplo 4: Búsqueda de cadenas con 'awk'
echo "Ejemplo 4: Búsqueda de cadenas con 'awk'"
echo "Texto de ejemplo: Este es un ejemplo de búsqueda de cadena con awk." > ejemplo4.txt

# Búsqueda de la palabra 'búsqueda' y muestra la línea encontrada en un archivo
awk '/búsqueda/ {print}' ejemplo4.txt > resultado_ejemplo4.txt
cat resultado_ejemplo4.txt

# Separador de ejemplos
echo "------------------------------------------------------------"

# Ejemplo 5: Extracción de campos con 'awk'
echo "Ejemplo 5: Extracción de campos con 'awk'"
printf "Texto de ejemplo: Juan 25\nMaria 30\nPedro 22" > ejemplo5.txt

# Muestra el segundo campo de cada línea en un archivo
awk '{print $2}' ejemplo5.txt > resultado_ejemplo5.txt
cat resultado_ejemplo5.txt

# Separador de ejemplos
echo "------------------------------------------------------------"

# Ejemplo 6: Uso de variables en 'awk'
echo "Ejemplo 6: Uso de variables en 'awk'"
printf "Texto de ejemplo: 5\n8\n12\n3" > ejemplo6.txt

# Calcula la suma de los números y muestra el resultado en un archivo
awk '{suma += $1} END {print "La suma es:", suma}' ejemplo6.txt > resultado_ejemplo6.txt
cat resultado_ejemplo6.txt

# Separador de ejemplos
echo "------------------------------------------------------------"

# Ejemplo 7: Patrones especiales BEGIN y END en 'awk'
echo "Ejemplo 7: Patrones especiales BEGIN y END en 'awk'"
printf "Texto de ejemplo: Inicio\nLínea 1\nLínea 2\nFin" > ejemplo7.txt

# Imprime la línea de inicio y fin en un archivo
awk 'BEGIN {print "Inicio"} /Fin/ {print} END {print "Fin"}' ejemplo7.txt > resultado_ejemplo7.txt
cat resultado_ejemplo7.txt

# Fin del script
