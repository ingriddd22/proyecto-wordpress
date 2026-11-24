# Informe Práctica 3: Administración de Gestores de Contenidos (RA3)

## 1. Roles y Permisos de Usuarios
- **Administrador:** Control total del sitio (ajustes, plugins, temas y usuarios).
- **Editor (`coord.web`):** Publica y edita entradas y páginas de cualquiera, modera comentarios y gestiona categorías, pero no toca plugins ni ajustes.
- **Autor (`profe.redes`):** Escribe, publica y borra sus propias entradas y sube imágenes, pero no edita contenido ajeno ni crea páginas.
- **Colaborador (`alumna.fct`):** Escribe sus entradas y las envía a revisión (`Enviar para revisión`), sin permiso para publicar ni subir imágenes.
- **Suscriptor (`familia.garcia`):** Solo lee el sitio y edita su propio perfil.
- **Revisor (`revisor.fp`):** Rol personalizado clonado de Editor al que se le han retirado las capacidades de borrado (`delete_*`) y gestión de categorías (`manage_categories`).

* **Capacidad para publicar:** `publish_posts`
* **Capacidad para subir ficheros:** `upload_files`

## 2. Selección de Plugins (R1 - R3)
- **R1 (Formulario de contacto con almacenamiento en BD):**
  - *Opciones comparadas:* **Contact Form 7 + Flamingo** frente a **WPForms Lite**.
  - *Elección:* **Contact Form 7 + Flamingo**, porque es gratuito sin limitaciones para guardar los envíos en la base de datos de WordPress (Flamingo) y permite desactivar el envío SMTP (`skip_mail: on`) en el entorno de prácticas.
- **R2 (Aviso de cookies LSSI/RGPD):**
  - *Opciones comparadas:* **GDPR Cookie Compliance** frente a **CookieYes**.
  - *Elección:* **GDPR Cookie Compliance**, por su alta valoración, actualizaciones frecuentes, compatibilidad con la versión actual de WordPress y facilidad para configurar botones de *Aceptar* y *Rechazar* en español con el mismo peso visual.
- **R3 (Registro de actividad de usuarios):**
  - *Opciones comparadas:* **Simple History** frente a **WP Activity Log**.
  - *Elección:* **Simple History**, por ser ligero, mostrar el historial directamente en el Escritorio de WordPress y registrar inicios de sesión, intentos fallidos y cambios en contenidos o plugins sin sobrecargar la base de datos.

## 3. Copias de Seguridad
- Realizadas mediante el script `scripts/backup.sh` (volcado de base de datos y empaquetado de `wp-content`).
- Restauración comprobada con `scripts/restore.sh`.

## Práctica 2. Copias de seguridad y restauración

* **Copia utilizada:** `20261124-145954`.
* **Qué se borró:** La entrada con ID `1` (*Hello world!*) con `./wp post delete 1 --force` y el plugin `flamingo` con `./wp plugin delete flamingo`.
* **Cómo se recuperó:** Ejecutando `./scripts/restore.sh 20261124-145954` y confirmando con `SI`. Tras comprobar con `./wp post list` y `./wp plugin list`, ambos volvieron a estar activos.
