## Estagio de compilaçao
##Uma imagem do linux para compilar o projeto
FROM ubuntu:latest AS build

## Instalar o JAVA 
RUN apt- get update
RUN apt-get install -y openjdk-21-jdk

## instalar o maven
RUN apt-get install -y maven

## COPY do projeto para o container
COPY . .

## compilar o projeto com o maven

RUN mvn clean install 

## execuçao do projeto
FROM openjdk:21-jdk-slim

# Expor a porta 8080
EXPOSE 8080

## copiar o arquivo jav da compilaçao para o container de execuçao
COPY --from=build /target/gamestore-0.0.1-SNAPSHOT.jar gamestore.jar

## DEfinir o comando de inicialização do container
ENTRYPOINT ["java", "-jar", "app.jar"]
