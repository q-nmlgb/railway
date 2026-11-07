FROM python:3.13-slim-bookworm
WORKDIR /app
COPY . .

RUN apt-get update && \
    apt-get install -y --no-install-recommends openssl bash curl ca-certificates && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x app.py && \
    pip install --no-cache-dir -r requirements.txt
EXPOSE 5000
CMD ["python", "app.py"]
