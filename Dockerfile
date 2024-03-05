FROM openjdk:21-slim

WORKDIR /apps
ARG JAR_FILE
COPY target/${JAR_FILE} /apps/app.jar
COPY entrypoint.sh /apps/entrypoint.sh

RUN adduser --system servuser
RUN chmod +x /apps/entrypoint.sh
RUN chown -R servuser /apps

USER servuser
EXPOSE 8080 8443
CMD ["/apps/entrypoint.sh"]
