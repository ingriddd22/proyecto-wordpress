# Pruebas de funcionamiento y rendimiento
| Prueba | Resultado | ¿Correcto? |
|---|---|---|
| Servicios en marcha | | |
| Sitio y panel | | |
| Subida de ficheros | | |
| Enlaces permanentes | | |
| Persistencia (down/up) | | |
| Seguridad (403) | | |
## Rendimiento
- Tiempos de respuesta en el aula (5 medidas):
- Memoria por contenedor (docker stats):
- Interpretación:
## Publicación
- Dirección desde la que accedió mi compañero/a:
- Dirección pública en Codespaces (paso 4, si lo hice):
- Tiempos desde Codespaces y comparación con el aula:


ingrid@DESKTOP-T5B5SI7:~/proyecto-wordpress$ for i in 1 2 3 4 5; do
  curl -o /dev/null -s -w "%{time_total}s\n" http://localhost:8080/
done
docker stats --no-stream
0.181709s
0.116326s
0.110023s
0.113587s
0.112186s
CONTAINER ID   NAME                             CPU %     MEM USAGE / LIMIT     MEM %     NET I/O          BLOCK I/O         PIDS
cfc887d62c77   proyecto-wordpress-nginx-1       0.00%     14.97MiB / 7.459GiB   0.20%     468kB / 470kB    0B / 0B           17
1881bbd80631   proyecto-wordpress-wordpress-1   0.01%     57.76MiB / 7.459GiB   0.76%     881kB / 527kB    51.1MB / 0B       3
e7829043528f   proyecto-wordpress-db-1          0.14%     96.53MiB / 7.459GiB   1.26%     65.5kB / 860kB   26.6MB / 57.3kB   12
