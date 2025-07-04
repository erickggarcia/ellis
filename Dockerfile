# 1. Use uma imagem base de Python estável e enxuta.
# A versão 3.11 é estável e a tag 'slim' oferece um bom balanço entre tamanho e compatibilidade.
FROM python:3.11-slim

# 2. Define o diretório de trabalho dentro do contêiner.
WORKDIR /app

# 3. Copia o arquivo de dependências primeiro para otimizar o cache do Docker.
COPY requirements.txt .

# 4. Instala as dependências.
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copia o restante do código da aplicação.
COPY . .

# 6. Expõe a porta em que a aplicação será executada.
EXPOSE 8000

# 7. Define o comando para iniciar a aplicação em modo de produção (sem --reload).
# O host '0.0.0.0' é essencial para que a aplicação seja acessível de fora do contêiner.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
