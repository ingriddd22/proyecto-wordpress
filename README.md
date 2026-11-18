# Proyecto WordPress con Docker (IAW - RA2)

Despliegue de un gestor de contenidos WordPress con Nginx, PHP-FPM y MariaDB mediante Docker Compose, endurecido y documentado.

## Requisitos
- Docker y Docker Compose v2
- Git

## Arranque desde cero (entorno local)
1. Clonar el repositorio:
   git clone <URL-DE-TU-REPOSITORIO>
   cd proyecto-wordpress
2. Configurar las variables de entorno:
   cp .env.example .env
   (Edita .env con tus contraseñas y nombres de base de datos)
3. Levantar los contenedores y crear la base de datos si es la primera vez:
   docker compose up -d
4. Acceder al sitio en http://localhost:8080 y al panel en http://localhost:8080/wp-admin.

## Ejecución en GitHub Codespaces
1. En GitHub, selecciona la rama correspondiente y pulsa Code -> Codespaces -> Create codespace.
2. Copia .env.example a .env, edita las variables y ejecuta docker compose up -d.
3. En la pestaña PORTS, pon el puerto 8080 en Public y abre la dirección https://...-8080.app.github.dev.

## Estructura del proyecto
- docker-compose.yml: definición de los servicios nginx, wordpress y db.
- nginx/default.conf: configuración de Nginx y reglas de bloqueo de seguridad.
- config/uploads.ini: límites de subida y memoria de PHP (64M / 256M).
- docs/: documentación de las prácticas del bloque.

## Documentación
- [Personalización del gestor](docs/personalizacion.md)
- [Seguridad del gestor](docs/seguridad.md)
- [Pruebas de funcionamiento y rendimiento](docs/pruebas.md)
