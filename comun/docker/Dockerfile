# Usar una imagen base de Ubuntu
FROM ubuntu:20.04

# Instalar dependencias necesarias (como wget y curl)
RUN apt-get update -y && \
    apt-get install -y \
    wget \
    curl \
    unzip \
    mysql-client \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Agregar el repositorio oficial de MariaDB
RUN curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | bash

# Instalar MariaDB
RUN apt-get update -y && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# Instalar Tomcat
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.55/bin/apache-tomcat-9.0.55.tar.gz -P /opt/ \
    && tar -xzvf /opt/apache-tomcat-9.0.55.tar.gz -C /opt/ \
    && rm /opt/apache-tomcat-9.0.55.tar.gz \
    && mv /opt/apache-tomcat-9.0.55 /opt/tomcat

# Copiar la aplicación de ejemplo de Tomcat
RUN wget https://tomcat.apache.org/tomcat-11.0-doc/appdev/sample/sample.war -P /opt/tomcat/webapps/

# Usar directamente la imagen de CloudBeaver desde Docker Hub
FROM dbeaver/cloudbeaver:latest

# Exponer puertos
EXPOSE 8080 8081

# Establecer las variables de entorno para MariaDB
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=exampledb

# Volumen para MariaDB
VOLUME /var/lib/mysql

# Configurar el comando de inicio: arrancar MariaDB, Tomcat y CloudBeaver
CMD service mysql start && \
    /opt/tomcat/bin/catalina.sh run & \
    /opt/cloudbeaver/cloudbeaver/bin/cloudbeaver & \
    wait
