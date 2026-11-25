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

## Práctica 3. Importar y exportar contenidos en distintos formatos

* **WXR (XML):** Exportado el sitio completo (`26` elementos entre entradas, páginas, formularios y ajustes) e importado `contenidos_asir.xml` (`6` entradas en *Noticias*, *Eventos* y *Prácticas*, más `2` páginas).
* **CSV y JSON:** Importados y actualizados los perfiles desde `usuarios.csv`, y exportados listados de entradas (`entradas.csv`) y usuarios (`usuarios.json`) con WP-CLI.
* **API REST (JSON):** Consultados los endpoints públicos `/wp-json/wp/v2/posts` y `/wp-json/wp/v2/users`.
* **SQL y seguridad:** Exportada la tabla `wp_users` (`wp_users.sql`), verificando la presencia de hashes `bcrypt` (`$wp$2y$...`) y comprobando que `exportaciones/` está en `.gitignore`.
* **Intercambio cooperativo:** Creada y exportada una entrada en la categoría *Prácticas* explicando los cuatro formatos, e importada la entrada correspondiente de mi pareja en el sitio.

## Práctica 4. Plantillas y sindicación

### 5. Tema hijo y edición de plantillas
* **Tema hijo (`iaw-hijo`):** Creado mediante WP-CLI heredando de `twentytwentyfive` y configurado con `theme.json` (fondo `#F4F7FA`, texto `#21295C` y enlaces `#065A82`).
* **Edición y creación:** Modificada la plantilla `Entradas individuales` (añadiendo autor y categorías) y la parte de plantilla `Pie`; creada la plantilla personalizada `Página informativa` (a ancho amplio, sin barra lateral ni comentarios) y asignada a *Horario del ciclo*.
* **Almacenamiento:** Comprobado con `./wp post list --post_type=wp_template,wp_template_part` que los cambios del Editor del sitio se almacenan en la base de datos (`single`, `footer` y `wp-custom-template-pagina-informativa`), mientras que en `wp-content/themes/iaw-hijo` permanecen intactos los archivos `style.css`, `functions.php` y `theme.json`.

### 6. Sindicación RSS 2.0 y Atom 1.0
| Característica | RSS 2.0 | Atom 1.0 | Ejemplo real del sitio |
| :--- | :--- | :--- | :--- |
| **Elemento raíz** | `<rss><channel>` | `<feed>` | `<rss version="2.0">` / `<feed xmlns="http://www.w3.org/2005/Atom">` |
| **Cada entrada** | `<item>` | `<entry>` | `<title>Formatos</title>` |
| **Fecha** | `<pubDate>` (RFC 822) | `<updated>` y `<published>` (ISO 8601) | `Tue, 24 Nov 2026 15:14:23 +0000` vs `2026-11-24T15:14:41Z` |
| **Identificador** | `<guid>` (opcional) | `<id>` (obligatorio) | `http://localhost:8080/feed/atom/` |
| **Estándar** | Especificación de Harvard | RFC 4287 del IETF | Validado correctamente en W3C Feed Validator |

* **Configuración e integración:** Limitado el feed a `5` elementos con `extracto` (`posts_per_rss=5`, `rss_use_excerpt=1`), validado en W3C (`This is a valid RSS feed`), añadido el icono RSS (`/feed/`) en el pie, el enlace de suscripción a Eventos (`/category/eventos/feed/`) y creada la página *Noticias del sector* consumiendo el feed oficial de WordPress y el de mi pareja.
