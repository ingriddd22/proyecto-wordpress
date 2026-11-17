# Informe Práctica 3: Administración de Gestores de Contenidos (RA3)

## 1. Roles y Permisos de Usuarios
- **Administrador:** Control total del sitio[cite: 4].
- **Editor:** Publica y edita entradas/páginas de cualquiera, modera comentarios[cite: 4].
- **Autor:** Escribe, publica y borra sus entradas; sube imágenes[cite: 4].
- **Colaborador:** Escribe sus entradas y las envía a revisión[cite: 4].
- **Suscriptor:** Lee el sitio y edita su propio perfil[cite: 4].
- **Revisor:** Rol personalizado para aprobar contenido sin permisos de borrado[cite: 6].

* **Capacidad para publicar:** `publish_posts`
* **Capacidad para subir ficheros:** `upload_files`

## 2. Selección de Plugins (R1 - R3)
- **R1:** Contact Form 7 + Flamingo (guarda los mensajes en base de datos)[cite: 7].
- **R2:** Plugin de aviso de cookies configurado con botones de aceptar y rechazar visibles.
- **R3:** Simple History para el registro de actividad de los usuarios[cite: 7].

## 3. Copias de Seguridad
- Realizadas mediante el script `scripts/backup.sh` (volcado de base de datos y empaquetado de `wp-content`)[cite: 14].
- Restauración comprobada con `scripts/restore.sh`[cite: 16].
