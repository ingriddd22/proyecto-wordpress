# Seguridad del gestor

| Comprobación | Antes | Después |
|---|---|---|
| Cabecera Server | nginx/1.25.x (muestra versión) | nginx (oculta versión) |
| /xmlrpc.php | 405 Method Not Allowed / 200 OK | 405 Method Not Allowed / Denegado |
| /wp-config.php | 200 OK | 403 Forbidden |
| PHP en uploads | 200 OK (ejecuta PHP, responde `2`) | 403 Forbidden |
| Edición de ficheros desde el panel | Habilitada | Deshabilitada (`DISALLOW_FILE_EDIT`) |
| Límite de intentos de login | Inexistente | Activo (bloqueo temporal) |

## Medidas aplicadas y por qué

1. **Ocultar versión de Nginx (`server_tokens off;`):** Evita exponer la versión exacta del servidor para prevenir ataques dirigidos a vulnerabilidades conocidas.
2. **Cabeceras de seguridad:** `X-Content-Type-Options: nosniff` previene el MIME-sniffing y `X-Frame-Options: SAMEORIGIN` evita ataques de Clickjacking.
3. **Bloqueo de archivos sensibles (`wp-config.php` y `xmlrpc.php`):** Protege los datos de credenciales y cierra vectores de fuerza bruta por XML-RPC.
4. **Restricción de PHP en `uploads`:** Bloquea la ejecución de scripts en la carpeta de subidas para evitar la ejecución remota de código (RCE).
5. **Desactivar editor del panel (`DISALLOW_FILE_EDIT`):** Evita la modificación de archivos de código desde el panel de administración.
6. **Límite de intentos de acceso:** Mitiga ataques de fuerza bruta al formulario de inicio de sesión.
