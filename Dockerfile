# Imagem oficial
FROM python:3.8.5

# Diretório de trabalho
WORKDIR /app

# Copia o conteúdo do diretório corrente para dentro do container em /app
ADD ./app /app

# Copia os requerimentos para dentro do container em /etc
#COPY ./requirements.txt /etc

# Pacotes necessários
#RUN apt-get install python3-devel mysql-devel

# Instala todos os pacotes necessários especificados em requirements.txt
RUN pip install -r /app/requirements.txt


# Deixar a porta 8080 disponível externamente
EXPOSE 8080

# Define as variáveis de ambiente
#ENV MYSQL_HOST myqsl
#ENV MYSQL_ROOT_PASSWORD senha
#ENV MYSQL_DATABASE test
#ENV MYSQL_USER test
#ENV MYSQL_PASSWORD test

# Executar app.py
CMD ["gunicorn", "-b", "0.0.0.0:8080", "jogoteca:app"]
