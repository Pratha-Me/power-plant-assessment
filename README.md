# Proshore Assessment Project

This is a Spring Boot project developed for a Java development position assessment.

**This project was developed and tested on a local (non-cloud environment) machine with macOS. Please consider replicating the conditions and meeting [the prerequisites](#prerequisites) as closely as possible!**

## Services
This latest release provides a web service. The first API serves as the point of entry for a bulk of battery information. The second API opens the possibility to fetch the mission-critical statistics on the existing batteries.

We have a roadmap for a feature-laden product. So, stay tuned for the forthcoming releases shortly!

## Project Description

The project is built over the Spring Boot framework. It includes various dependencies and tools. It is designed to serve and perform at best. The tools used in the project provide the following top-notch characteristics.

- Spring Boot for building robust, production-ready applications.
- Spring Data JPA for data persistence.
- PostgreSQL as the relational database.
- Flyway for database migration.
- OpenAPI 3.0 documentation for proper API documentation.
- A testing framework with JUnit 5 and JaCoCo test code coverage.
- Lombok and MapStruct for simplifying code and mapping logic.

## Prerequisites
Before consuming the service, please ensure you have the following prerequisites installed.
- Java 17 or higher
- Maven
- Docker
- SonarQube (For code analysis)

## Clone the repo - Github
Clone the repository (In your terminal application):

   ```shell
   git clone https://github.com/Pratha-Me/power-plant-assessment
   ```

Once the project has been cloned. You can just navigate yourself to the root directory of the project. From the root directory run. The default branch is named, "main", this branch is used for development and testing purposes. The production branch is named, "production-V1.0", which bears necessary configurations to be released.

<dl>
<dt>Please note:</dt>
</dl>

1. The root directory bears all the essential scripts and configuration files for the complete operations of the project. Any script or command must be executed from the root directory
2. There are three shell scripts in the root directory. The first is start-script.sh, which will spin up docker containers and make the service available without breaking a sweat. The second is stop-script.sh, this script will terminate running services. The last is sonarqube-script.sh, which will trigger the code check as outlined by the SonarQube.
3. The time to build the project, pull the docker images, and run the docker containers might take around 5-10 minutes or so for the first time. On subsequent start and stop cycle the application will spin up and down quicker. The docker needs to pull the images for Java 17, PostgreSQL 15, and SonarQube, so, the strength of you internet connection will be vital to reduce the boot up time, especially for the first run.
4. In the case where docker is not available or installed, the database and SonarQube can be sourced from other means. The section herein, [Without Docker](#without-docker) provides further details.

## Start & Stop from the shell script
The file `start-script.sh` present in the root directory has sufficient commands to build and run the project.

   ```shell
   sh start-script.sh
   ```
This script alone will execute all the necessary commands to make the service available. Alternatively, you can opt for the procedures laid out in the immediate section below.

Similar to the start script, the stop script will perform necessary shut down steps.

   ```shell
   sh stop-script.sh
   ```

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

### 2. Run Docker Containers
   ```shell
   docker-compose -p powerplant-web-services up -d
   ```

## Without Docker
### For Postgres Database
Navigate to the file `src/main/resources/application-local.properties`then replace every term in the format like `![PLACEHOLDER]` with the correct values.

For example, if you want to set `admin` in `spring.datasource.username=![POSTGRESDB_USER]` then after you have substituted the value, the line should be like `spring.datasource.username=admin`

### For Sonarqube
Please follow the [sonarqube official guidelines](https://docs.sonarsource.com/sonarqube/latest/try-out-sonarqube/)
to run the Sonarqube services on your local machine.

## Consuming Services
<b>Once you have the application up and running</b> continue with following two sections on Open APIs to consume the REST APIs and SonarQube to monitor and generate exhaustive code analysis reports.

### Open API documentations
The Open API 3.0 is auto-configured and available for only local and development environment. For the production environment it is not configured and shut off as well, which provides reassurance. 

To access the API documentation, you can open the swagger-ui link [from here](http://localhost:8080/power-plant/web) in your browser. 

The APIs are hosted here, http://localhost:8080/power-plant/api-docs. From this link,

1. You can import the APIs in to Http client like Postman.
2. [Click here](http://localhost:8080/power-plant/api-docs) to obtain the JSON format for import source in Postman

Follow the [official postman documentation](https://learning.postman.com/docs/designing-and-developing-your-api/importing-an-api/#import-an-api-definition) on how to import the API Definitions.

For your quick access, I have created a table to describe the Endpoints. The {{baseUrl}} is http://localhost:8080 if you are running the application in you local machine. Do not forget to adjust this value according to your environment.


| Endpoint      | Http verb | Request Body                                                                                                                                           |                 Query parameter(s) |
|---------------|:---------:|--------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------:|
|     {{baseUrl}}/battery/all  |   POST    | `[ { "capacity": "<integer>", "name": "<string>", "postcode": "<string>" }, { "capacity": "<integer>", "name": "<string>", "postcode": "<string>" } ]` |                      NotApplicable |
| {{baseUrl}}/battery/postcode/range|    GET    | Not Applicable                                                                                                                                         | minPostCode=6000, maxPostCode=6102 |


For the POST API, you can [go here](#sample-data) for the sample data. A demonstration of working with the APIs is [shown here](https://drive.google.com/file/d/1-je2muYKOlEHTtqgBPToaHYPGm3IHDGE/view?usp=share_link)

### SonarCube Demonstration

I presume you have an account with SonarQube. My account (for) is setup and my credentials are en listed below

<b>username:</b> admin 
<br>
<b>password:</b> pass

Follow guidelines from [this official documentation](https://docs.sonarsource.com/sonarqube/latest/try-out-sonarqube/) to login or to setup account and run the SonarQube code check on your project. Once you obtain the build script (For maven, gradle, and so on), in your terminal application you should navigate to the root directory of the project and run the script. 

If you do not have maven or gradle installed in your machine then you can use the bundled wrapper. Replace mvn or gradle with ./mvnw or ./gradlew.

I have performed the code check for my production ready code. The demonstration is [shown here](https://drive.google.com/file/d/1BLFf8aq_Vn5meYH6OXczCY8coodSGJt5/view?usp=share_link).

Please note: I performed my code checks solely on the local environment. I did not setup any cloud based code check services in SonarQube.

## Sample Data
```
[
    {
        "name": "Cannington",
        "postcode": "6107",
        "capacity": 13500
    },
    {
        "name": "Midland",
        "postcode": "6057",
        "capacity": 50500
    },
    {
        "name": "Hay Street",
        "postcode": "6000",
        "capacity": 23500
    },
    {
        "name": "Mount Adams",
        "postcode": "6525",
        "capacity": 12000
    },
    {
        "name": "Koolan Island",
        "postcode": "6733",
        "capacity": 10000
    },
    {
        "name": "Armadale",
        "postcode": "6992",
        "capacity": 25000
    },
    {
        "name": "Lesmurdie",
        "postcode": "6076",
        "capacity": 13500
    },
    {
        "name": "Kalamunda",
        "postcode": "6076",
        "capacity": 13500
    },
    {
        "name": "Carmel",
        "postcode": "6076",
        "capacity": 36000
    },
    {
        "name": "Bentley",
        "postcode": "6102",
        "capacity": 85000
    },
    {
        "name": "Akunda Bay",
        "postcode": "2084",
        "capacity": 13500
    },
    {
        "name": "Werrington County",
        "postcode": "2747",
        "capacity": 13500
    },
    {
        "name": "Bagot",
        "postcode": "0820",
        "capacity": 27000
    },
    {
        "name": "Yirrkala",
        "postcode": "0880",
        "capacity": 13500
    },
    {
        "name": "University of Melbourne",
        "postcode": "3010",
        "capacity": 85000
    },
    {
        "name": "Norfolk Island",
        "postcode": "2899",
        "capacity": 13500
    },
    {
        "name": "Ootha",
        "postcode": "2875",
        "capacity": 13500
    },
    {
        "name": "Kent Town",
        "postcode": "5067",
        "capacity": 13500
    },
    {
        "name": "Northgate Mc",
        "postcode": "9464",
        "capacity": 13500
    },
    {
        "name": "Gold Coast Mc",
        "postcode": "9729",
        "capacity": 50000
    }
]
```

