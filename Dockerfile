FROM python:3.11-slim

# Install LibreOffice (headless) and fonts for accurate rendering
RUN apt-get update && apt-get install -y --no-install-recommends \
    libreoffice \
    libreoffice-writer \
    libreoffice-impress \
    libreoffice-calc \
    fonts-liberation \
    fonts-dejavu \
    fonts-noto \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN mkdir -p uploads outputs && chmod -R 777 uploads outputs && chmod -R 777 /app

# Hugging Face Spaces expects the app on port 7860
EXPOSE 7860

CMD ["python3", "app.py"]
