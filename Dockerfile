FROM ubuntu:latest
RUN apt-get update && \
    apt-get install jq -y && \
    apt-get install curl -y 
COPY ./test.sh .
RUN chmod +x /test.sh
ENTRYPOINT ["/test.sh"]
