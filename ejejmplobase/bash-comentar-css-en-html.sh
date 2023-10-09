#!/bin/bash

#!/bin/bash

# Verifica si se proporciona un archivo HTML como argumento
if [ $# -ne 1 ]; then
  echo "Uso: $0 archivo.html"
  exit 1
fi

# Verifica si el archivo existe
if [ ! -f "$1" ]; then
  echo "El archivo $1 no existe."
  exit 1
fi

# Muestra las líneas con números
nl "$1"

# Solicita al usuario que ingrese el número de línea para comentar
read -pr "Ingrese el número de línea que desea comentar: " linea

# Comprueba si la entrada es un número válido
if ! [[ "$linea" =~ ^[0-9]+$ ]]; then
  echo "Por favor, ingrese un número válido."
  exit 1
fi

# Agrega comentarios <!-- al principio y --> al final de la línea seleccionada
sed -i "${linea}s/^/<!-- /; ${linea}s/$/ -->/" "$1"

echo "Comentario agregado a la línea $linea."

