# Usa l'immagine ufficiale di MySQL con la versione 9.1.0
FROM mysql:9.1.0

# Copia il file di inizializzazione nella directory di MySQL
COPY init.sql /docker-entrypoint-initdb.d/

# Esponi la porta 3306 per il database
EXPOSE 3306
