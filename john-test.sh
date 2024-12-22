#!/bin/bash

if [ $# -lt 2 ]; then
    # Default system method (variable used only to show in help)
    SYSTEM_METHOD=$(grep ^ENCRYPT_METHOD /etc/login.defs | awk '{print tolower($2)}')

    # Available methods with mkpasswd (used only to show in help)
    AVAILABLE_METHODS=$(mkpasswd -m help | tail -n +2 | awk '{print $1}' | tr '\n' ' ')
    cat <<EOF
Uso: $0 <usuario> <contraseña> [método de encriptación]

Este script genera una línea con el formato que hay en /etc/shadow como si fuera la del usuario indicado.

Propósito:
   - Crear contraseñas para probar su efectividad con herramientas como John The Ripper.
   - Estas líneas pueden añadirse a un fichero y luego analizarse con John.

Consideraciones:
   - Se recomienda usar John desde Kali, ya que incluye diccionarios listos para usar.
   - ¡Te sorprenderá lo rápido que algunas contraseñas pueden ser crackeadas!

Métodos de encriptación:
   - Si no se especifica método, se usará el del sistema, que es $SYSTEM_METHOD.
   - Los métodos disponibles son: $AVAILABLE_METHODS
Ejemplo de uso:
  $ $0 pedro letmein > lista.txt
  $ $0 maria maria98 >> lista.txt
  $ john --format=crypt lista.txt

EOF
    exit 1
fi

if [[ "$3" == "" ]]; then
    echo "$1:$(mkpasswd "$2")::::::"
else
    echo "$1:$(mkpasswd -m "$3" "$2")::::::"
fi
