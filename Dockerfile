FROM adoptopenjdk/openjdk11
RUN apt-get update && apt-get install -y unzip
WORKDIR /apim
COPY ./product/wso2am-4.0.0.zip .
RUN unzip -q wso2am-4.0.0.zip

COPY ./main.sh .
RUN chmod +x main.sh

COPY ./h2-database-config.toml .

EXPOSE 8280/tcp
EXPOSE 8243/tcp
EXPOSE 9611/tcp
EXPOSE 9711/tcp 
EXPOSE 5672/tcp
EXPOSE 9443/tcp
EXPOSE 9021/tcp
EXPOSE 8021/tcp

ENTRYPOINT ["sh", "main.sh"]
