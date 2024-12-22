# John Test
Este script genera una línea con el formato que hay en `/etc/shadow` como si fuera la del usuario indicado.

## Propósito:
- Crear contraseñas para probar su efectividad con herramientas como `John The Ripper`.
- Estas líneas pueden añadirse a un fichero y luego analizarse con John.

## Consideraciones:
- Se recomienda usar John desde `Kali`, ya que incluye diccionarios listos para usar.
- ¡Te sorprenderá lo rápido que algunas contraseñas pueden ser crackeadas!

## Métodos de encriptación:
- Si no se especifica método, se usará el actual del sistema.
- En la ayuda aparece el método actual y los disponibles.
## Ejemplo de uso (encriptación por defecto):
```bash
  $ ./john-test.sh pedro letmein > lista.txt
  $ ./john-test.sh maria maria98 >> lista.txt
  $ john --format=crypt lista.txt
```
El fichero generado simula lineas de `/etc/shadow` que maneja john sin problemas:
```bash
$ cat lista.txt 
pedro:$y$j9T$ZZHK4igue0HzhFYpxnfa7/$Wb6Tag5jMZ0SWqlgW5/Lh192D64c8uej0/kFyiEe9K3::::::
maria:$y$j9T$xV2tHhsZlxeI4q.qqxRFl1$akR0HVq8vSXcdKg0SjJu4GEJeK4.fY3Z.KCY7cJkuL2::::::

```