FROM carsharing/alpine-oraclejdk8-bash
ADD build/libs/calculator-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT [ "java", "-jar", "app.jar" ]

