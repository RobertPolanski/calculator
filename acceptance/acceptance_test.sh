#!/bin/bash
sleep 10
# test $(curl calculator:8080/sum?a=1\&b=2) -eq 3
CALCULATOR_PORT=$(docker-compose port calculator 8080 | cut -d: -f2)
./gradlew acceptanceTest -Dcalculator.url=http://localhost:$CALCULATOR_PORT