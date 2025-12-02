# Estágio de Build
FROM maven:3.9-amazoncorretto-21 AS build
WORKDIR /app

# 1. Copia SÓ o pom.xml primeiro
COPY pom.xml .

# 2. Baixa as dependências (Isso fica em cache se o pom.xml não mudar)
RUN mvn dependency:go-offline

# 3. Só agora copia o código fonte
COPY src ./src

# 4. Compila (usando as dependências já baixadas)
RUN mvn clean package -DskipTests

# Estágio Final (Run) - Continua igual
FROM amazoncorretto:21-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080 
# (Lembre de ajustar o EXPOSE para a porta correta de cada projeto: 8080, 8081 ou 8082)
ENTRYPOINT ["java", "-jar", "app.jar"]