FROM maven:3.8.4-jdk-8
COPY . /project

COPY entrypoint.sh /project
RUN chmod +x /project/entrypoint.sh
RUN chmod +x /project/thumbnail.sh
ENTRYPOINT ["/project/entrypoint.sh"]

VOLUME /pics
