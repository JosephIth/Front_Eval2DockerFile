FROM python:3.11-slim

#DIR ESTABLECIDO :P
WORKDIR /app

#DEPENDENCIAS DEL SISTEMA
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

#COPIAR REQUERIMIENTOS
COPY requirements.txt .
#INSTALAR REQUERIMIENTOS
RUN pip install --no-cache-dir -r requirements.txt

#Copiar App restante
COPY . .

#EXPOSIÓN DEL PUERTO (FLASK (CREO?))
EXPOSE 5000

#COMANDO PARA EJECUTAR LA APLICACIÓN
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]