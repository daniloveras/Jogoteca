# Imagem oficial
FROM python:3.7.9-alpine3.12

# Diretório de trabalho
WORKDIR /app

# Copia o conteúdo do diretório corrente para dentro do container em /app
ADD ./app /app

# Copia os requerimentos para dentro do container em /etc
COPY ./requirements.txt /etc

# Instala todos os pacotes necessários especificados em requirements.txt
RUN pip install -r /etc/requirements.txt

# Deixar a porta 8080 disponível externamente
EXPOSE 8080

# Define as variáveis de ambiente
ENV MYSQL_HOST myqsl
ENV MYSQL_ROOT_PASSWORD senha
ENV MYSQL_DATABASE test
ENV MYSQL_USER test
ENV MYSQL_PASSWORD test

# Executar app.py
CMD ["python", "app.py"]