#!/bin/bash
 sleep 20
CALCULATOR_PORT=$(docker-compose port calculator 8080 | cut -d: -f2)
test $(curl calculator:$CALCULATOR_PORT/sum?a=1\&b=2) -eq 3
