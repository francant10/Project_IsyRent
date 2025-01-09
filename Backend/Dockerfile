# Usa l'immagine ufficiale di Python con la versione 3.13.1 completa
FROM python:3.13.1

# Imposta la directory di lavoro nel container
WORKDIR /app

# Copia i file del backend nel container
COPY . /app

# Installa le dipendenze dal file requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Esponi la porta 5000 per il servizio Flask
EXPOSE 5000

# Comando per avviare l'app Flask
CMD ["python", "app.py"]
