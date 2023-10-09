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

  # Muestra las líneas con números del archivo seleccionado
  nl "$archivo"

  echo "Seleccione una acción:"
  echo "1. Comentar una línea"
  echo "2. Descomentar una línea"
  echo "3. Salir"

  read -p "Opción: " opcion

  case "$opcion" in
    1)
      # Solicita al usuario que ingrese el número de línea que desea comentar
      read -p "Ingrese el número de línea que desea comentar: " linea

      # Comprueba si la entrada es un número válido
      if ! [[ "$linea" =~ ^[0-9]+$ ]]; then
        echo "Por favor, ingrese un número válido."
        continue
      fi

      # Obtiene el contenido de la línea seleccionada
      linea_contenido=$(sed -n "${linea}p" "$archivo")

      # Agrega los comentarios <!-- y --> al contenido de la línea con un espacio extra hacia la izquierda
      linea_contenido=" <!-- $linea_contenido -->"

      # Actualiza la línea en el archivo con el nuevo contenido
      sed -i "${linea}s/.*/$linea_contenido/" "$archivo"

      echo "Comentario agregado a la línea $linea en el archivo $archivo."
      ;;
    2)
      # Solicita al usuario que ingrese el número de línea que desea descomentar
      read -p "Ingrese el número de línea que desea descomentar: " linea

      # Comprueba si la entrada es un número válido
      if ! [[ "$linea" =~ ^[0-9]+$ ]]; then
        echo "Por favor, ingrese un número válido."
        continue
      fi

      # Elimina los comentarios <!-- y --> de la línea
      sed -i "${linea}s/<!-- \(.*\) -->/\1/" "$archivo"

      echo "Comentarios eliminados de la línea $linea en el archivo $archivo."
      ;;
    3)
      echo "Saliendo del programa."
      exit 0
      ;;
    *)
      echo "Opción no válida. Por favor, elija una opción válida."
      ;;
  esac
done
