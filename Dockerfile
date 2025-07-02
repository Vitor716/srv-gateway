# Usa o Amazon Corretto 21 como base (Java 21)
FROM amazoncorretto:21

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia o JAR do serviço condominio para dentro do container
COPY target/srv-gateway-0.0.1-SNAPSHOT.jar app.jar

# Expõe a porta do serviço condominio
EXPOSE 8080

# Comando para iniciar a aplicação
CMD ["java", "-jar", "app.jar"]
