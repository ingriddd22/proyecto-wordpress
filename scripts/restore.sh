#!/usr/bin/env bash
# restore.sh - Restauración de copia de seguridad del WordPress del stack (RA3 práctica 2)
set -euo pipefail

cd "$(dirname "$0")/.."
ORIGEN="backups"

if [ $# -eq 0 ]; then
  echo "Copias disponibles en $ORIGEN/:"
  ls -1 "$ORIGEN"/db_*.sql.gz 2>/dev/null | sed -E 's/.*db_(.*)\.sql\.gz/  \1/' || echo "  (ninguna)"
  echo "Uso: $0 AAAAMMDD-HHMMSS"
  exit 0
fi

FECHA="$1"
F_DB="$ORIGEN/db_$FECHA.sql.gz"
F_WP="$ORIGEN/wp-content_$FECHA.tar.gz"

if [ ! -f "$F_DB" ] || [ ! -f "$F_WP" ]; then
  echo "ERROR: no existen los ficheros de la copia '$FECHA'." >&2
  exit 1
fi

for servicio in db wordpress; do
  if ! docker compose ps --status running --services | grep -qx "$servicio"; then
    echo "ERROR: el servicio '$servicio' no está en marcha. Ejecuta: docker compose up -d" >&2
    exit 1
  fi
done

echo "ATENCIÓN: Se van a sobrescribir la base de datos y wp-content con la copia $FECHA."
read -r -p "Escribe SI para continuar: " CONFIRMAR
if [ "$CONFIRMAR" != "SI" ]; then
  echo "Restauración cancelada."
  exit 1
fi

echo "-> Restaurando base de datos..."
gunzip -c "$F_DB" | docker compose exec -T db sh -c '
  exec mariadb -u"$WP_DB_USER" -p"$WP_DB_PASSWORD" "$WP_DB_NAME"
'

echo "-> Restaurando wp-content..."
docker compose exec -T wordpress rm -rf /var/www/html/wp-content
docker compose exec -T wordpress tar -xzf - -C /var/www/html < "$F_WP"
docker compose exec -T wordpress chown -R www-data:www-data /var/www/html/wp-content

echo "OK. Restauración completada desde $FECHA."
