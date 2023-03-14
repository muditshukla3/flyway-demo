## Introduction
This is sample project to demonstrate how to use flyway for database migration in spring boot project.

#### Dependencies
Add the following dependencies in pom.xml after creating spring boot project from start.spring.io

```
 <dependency>
    <groupId>org.flywaydb</groupId>
    <artifactId>flyway-core</artifactId>
 </dependency>
 <dependency>
    <groupId>org.postgresql</groupId>
    <artifactId>postgresql</artifactId>
    <scope>runtime</scope>
 </dependency>
```
Add the following maven plugin to run flyway migration via mvn command line.

```
<plugin>
  <groupId>org.flywaydb</groupId>
  <artifactId>flyway-maven-plugin</artifactId>
  <version>8.5.13</version>
</plugin>
```
#### Flyway Configuration
Spring Boot works really well with its defaults, but in this project we are skipping the defaults. Add the following property to disable flyway migration at application startup

```
spring:
  flyway:
    enabled: false
```
We'll run the flyway migration using maven plugin. Create flyway config file under project root directory with following configuration

***flywayConfig.conf***
```
flyway.url=jdbc:postgresql://localhost:5432/postgres?currentSchema=flyway-test
flyway.locations=filesystem:src/main/resources/db/migration
```

Create db migration .sql files under src/main/resources/db/migration folder.

Once the .sql files are in place run the following command to run flyway migration.
```
mvn clean flyway:migrate -Dflyway.user=pguser -Dflyway.password=pguser -Dflyway.configFiles=flywayConfig.conf
```

After successful run of mvn command flyway_schema_history table will record the previously ran migrations.

### Note
1. Flyway community edition does not include feature to rollback the db migration automatically. For community edition users the way to rollback db changes is to create rollback sql scripts and run the ***mvn flyway:migrate*** command. 
2. Running flyway migrations using maven plugin gives the flexibility to automate the migration process via CI/CD.
