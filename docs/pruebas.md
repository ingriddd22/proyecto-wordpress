# Pruebas de funcionamiento y rendimiento

| Prueba | Resultado | ¿Correcto? |
|---|---|---|
| Servicios en marcha | 3 contenedores activos (`nginx`, `wordpress`, `db`) | Sí |
| Sitio y panel | Cargan correctamente `/` y `/wp-admin` con el tema activo | Sí |
| Subida de ficheros | Imagen de varios MB subida sin error (límite PHP 64M) | Sí |
| Enlaces permanentes | Las entradas abren por su slug sin error 404 | Sí |
| Persistencia (down/up) | Tras `docker compose down` y `up -d` se conservan datos y ajustes | Sí |
| Seguridad (403) | `/xmlrpc.php` y `/wp-config.php` devuelven `403 Forbidden` | Sí |

## Rendimiento
- **Tiempos de respuesta en el aula (5 medidas):** 0.118s, 0.116s, 0.110s, 0.114s, 0.112s
- **Memoria por contenedor (`docker stats`):**
  - `nginx`: 14.97 MiB
  - `wordpress`: 57.76 MiB
  - `db` (MariaDB): 96.53 MiB
- **Interpretación:** La primera petición es ligeramente más lenta porque PHP-FPM y MariaDB inicializan cachés; las siguientes se estabilizan en torno a 0.11s. El mayor consumo de memoria corresponde a la base de datos MariaDB (~96.5 MiB), mientras que Nginx apenas consume ~15 MiB.

## Publicación
- **Dirección desde la que accedió mi compañero/a:** http://172.17.91.125:8080
- **Dirección pública en Codespaces (paso 4, si lo hice):** Publicado temporalmente en puerto 8080 (`https://<codespace>-8080.app.github.dev`)
- **Tiempos desde Codespaces y comparación con el aula:** En Codespaces los tiempos son ligeramente superiores por la latencia de red hacia Internet y el proxy HTTPS de GitHub respecto a la red local del aula.
