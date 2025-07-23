FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Install curl and unzip
RUN apt-get update && apt-get install -y curl unzip && rm -rf /var/lib/apt/lists/*

# Download the zip file from Artifactory
RUN curl -u "<USERNAME>:<PASSWORD>" -O "https://<ARTIFACTORY_URL>/<REPO>/<PATH>/myapp-1.0-SNAPSHOT.zip"

### If .netrc file authentication for artifactory
# COPY <path/to/.netrc/file> /root/.netrc
# RUN chmod 600 /root/.netrc
# RUN curl -n -O "https://<ARTIFACTORY_URL>/<REPO>/myapp-1.0-SNAPSHOT.zip"

# Unzip the downloaded file
RUN unzip myapp-1.0-SNAPSHOT.zip && rm myapp-1.0-SNAPSHOT.zip

# Assuming the zip contains a single .jar or .war, adjust accordingly
# If it's a WAR, you'd need a servlet container like Tomcat

# Expose application port
EXPOSE 8081

# Run the jar file (update the name if needed)
CMD ["java", "-jar", "myapp-1.0-SNAPSHOT.jar"]
