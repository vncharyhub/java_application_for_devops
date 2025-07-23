#!/bin/bash

# Step 1: Build the JAR
mvn clean package

# Step 2: Upload to S3
aws s3 cp target/myapp-1.0-SNAPSHOT.jar s3://java-file-backup/myapp-1.0-SNAPSHOT.jar
