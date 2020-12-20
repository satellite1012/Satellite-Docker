FROM tomcat:jdk8
ADD /out/artifacts/Satellite_war/ROOT.war /usr/local/tomcat/webapps/satellite.war
EXPOSE 8080
CMD ["catalina.sh", "run"]