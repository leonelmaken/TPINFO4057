# Utilisez une image OpenJDK 17
FROM openjdk:17

# Informations sur le mainteneur
MAINTAINER Leonel Maken <leonel.dongmo2@facsciences-uy1.cm>

# Définition du répertoire de travail dans l'image
WORKDIR /usr/share/communication-service

# Copie de tous les fichiers JAR du répertoire target
COPY target/*.jar /usr/share/communication-service/

# Exposer le port nécessaire
EXPOSE 8085

# Commande d'entrée pour exécuter l'application Spring Boot
ENTRYPOINT ["java", "-jar", "Communication-0.0.1-SNAPSHOT.jar"]


