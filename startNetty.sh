#!/bin/bash

echo "Stopping any running containers..."
docker kill $(docker ps -q)
echo "All running containers stopped"

echo "Starting new container for $1..."
case $1 in
	API-1)
		docker run -d --cpus=4 --memory=8192m -p8602:8688 netty java -jar netty-http-echo-service.jar 
		;;
	API-2)
                docker run -d --cpus=1 --memory=1024m -p8702:8688 netty-isprime java -Xms512m -Xmx512m -jar netty-http-echo-service-0.4.6-SNAPSHOT-isPrime.jar --number 1688471
		;;
	API-3)
                docker run -d --cpus=1 --memory=1024m -p8802:8688 netty-isprime java -Xms512m -Xmx512m -jar netty-http-echo-service-0.4.6-SNAPSHOT-isPrime.jar --number 310091
		;;
	API-4)
                docker run -d --cpus=1 --memory=1024m -p8902:8688 netty-isprime java -Xms512m -Xmx512m -jar netty-http-echo-service-0.4.6-SNAPSHOT-isPrime.jar --number 154387
		;;
	*)
		echo "Please provide API-1/API-2/API-3/API-4 as argument"
		exit 1
esac
echo "New container for $1 started"

