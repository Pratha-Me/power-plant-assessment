# Spring Boot Assessment Project

This is a Spring Boot project developed for a Java development position assessment.

**This project was developed and tested on a local (non-cloud environment) machine with macOS. Please consider to replicate the conditions and meet the Prerequisites as closely as possible!**

## Project Description

The project is built over Spring Boot framework. It includes various dependencies and tools. It is designed to serve and perform at best. The tools used in project provides following characteristics:

- Spring Boot for building robust, production-ready applications. 
- Spring Data JPA for data persistence.
- PostgreSQL as the relational database.
- Flyway for database migration.
- OpenAPI 3.0 documentation using Springdoc.
- Testing framework with JUnit 5 and JaCoCo code coverage.
- Lombok and MapStruct for simplifying code and mapping.

## Services
The web service provides two APIs. The first API serves the point of entry for a bulk of batteries information. The second API opens the possibility to fetch the mission-critical statistics pertaining to the existing batteries.

## Prerequisites
Before setting up the project, ensure you have the following prerequisites installed:
- Java 17
- Maven
- Docker
- SonarQube (For code analysis)

## Clone - Github
Clone the repository (In your terminal application):

   ```shell
   git clone https://github.com/Pratha-Me/power-plant-assessment
   ```

Once the project has been cloned. Navigate yourself to the root directory of the project. From the root directory run.

<dl>
<dt>Please note:</dt>
<dd>
1. The root project bears all the essential scripts and configuration files for project operations.
</dd>
<dd>
2. Time taken to build the project, pull the docker images and run the docker containers might take around 5-10 minutes or so for the first time
</dd>
</dl>

## Run shell script
The file `run-script.sh` present in the root directory has sufficient commands to build and run the project. 

## Manual Build & Run
### 1. Run Maven tools
<dl>
<dt>With the test cases</dt>
<dd>

   ```shell
   mvn clean install
   ```
OR
   ```shell
   ./mvnw clean install
   ```

</dd>
<dt>Without the test cases</dt>
<dd>

   ```shell
   mvn clean compile -DskipTests
   ```
OR
   ```shell
   ./mvnw clean compile -DskipTests
   ```

</dd>
</dl>

### 2. Run Docker tools
   ```shell
   docker-compose up -d
   ```
