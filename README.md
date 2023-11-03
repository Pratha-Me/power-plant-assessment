# Proshore Assessment Project

This is a Spring Boot project developed for a Java development position assessment.

**This project was developed and tested on a local (non-cloud environment) machine with macOS. Please consider to replicate the conditions and meet the prerequisites as closely as possible!**

## Services
This latest release provides a web service. The first API serves the point of entry for a bulk of batteries information. The second API opens the possibility to fetch the mission-critical statistics pertaining to the existing batteries.

We have a roadmap for a feature-laden product. So, stay tuned for the forthcoming releases in near future!

## Project Description

The project is built over Spring Boot framework. It includes various dependencies and tools. It is designed to serve and perform at best. The tools used in project provides following top-notch characteristics.

- Spring Boot for building robust, production-ready applications. 
- Spring Data JPA for data persistence.
- PostgreSQL as the relational database.
- Flyway for database migration.
- OpenAPI 3.0 documentation for proper API documentation.
- Testing framework with JUnit 5 and JaCoCo test code coverage.
- Lombok and MapStruct for simplifying code and mapping logic.

## Prerequisites
Before consuming the service, please ensure you have the following prerequisites installed.
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
1. The root directory bears all the essential scripts and configuration files for the complete operations of the project. Any script or command must be executed from the root directory
</dd>
<dd>
2. Time taken to build the project, pull the docker images and run the docker containers might take around 5-10 minutes or so for the first time
</dd>
<dd>
3. In the case where docker is not available or installed, the database and sonarqube can be sourced from other means. [This section](#without-docker) provides further details. 
</dd>
</dl>

## Run shell script
The file `run-script.sh` present in the root directory has sufficient commands to build and run the project.

   ```shell
   sh run-script.sh
   ```
This script alone will execute all the necessary commands to make the service available. Alternatively, you can opt for the procedures laid out in the immediate section below. 

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
   docker-compose -p powerplant-web-services up -d
   ```
## Without Docker
### For Postgres Database
Navigate to the file `src/main/resources/application-local.properties`then replace every term in the format like `![PLACEHOLDER]` with the correct values. 

For example, if you want to set `admin` in `spring.datasource.username=![POSTGRESDB_USER]`then after you have done the line should be like `spring.datasource.username=admin` 

### For Sonarqube
Please follow the (sonarqube official guidelines)[https://docs.sonarsource.com/sonarqube/latest/try-out-sonarqube/] 
to run the sonarqube services in your local machine.

## Open API documentations
## SonarCube Demonstration