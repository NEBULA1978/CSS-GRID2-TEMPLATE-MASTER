#!/bin/bash

while true; do
  echo "Seleccione un archivo HTML:"
  
  # Mostrar archivos en la carpeta actual
  archivos=(./*.html)
  if [ ${#archivos[@]} -eq 0 ]; then
    echo "No se encontraron archivos HTML en la carpeta actual."
    exit 1
  fi
  
  select archivo in "${archivos[@]}"; do
    if [ -n "$archivo" ]; then
      echo "Archivo seleccionado: $archivo"
      break
    else
      echo "Opción no válida. Por favor, elija un archivo válido."
    fi
  done

  # Muestra las líneas con números
  nl "$archivo"

  # Solicita al usuario que ingrese el número de línea que desea comentar
  read -p "Ingrese el número de línea que desea comentar (separado por espacios en blanco): " lineas

  # Comprueba si las entradas son números válidos
  if ! [[ "$lineas" =~ ^[0-9\ ]+$ ]]; then
    echo "Por favor, ingrese números válidos."
    continue
  fi

  # Agrega comentarios <!-- al principio y --> al final de las líneas seleccionadas
  for linea in $lineas; do
    sed -i "${linea}s/^/<!-- /; ${linea}s/$/ -->/" "$archivo"
    echo "Comentario agregado a la línea $linea en el archivo $archivo."
  done
done
