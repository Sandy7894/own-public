FROM ubuntu:latest
RUN apt-get update && \
    apt-get install jq -y && \
    apt-get install curl -y 
COPY ./jfrog.sh .
RUN chmod +x /jfrog.sh
ENTRYPOINT ["/jfrog.sh"]
