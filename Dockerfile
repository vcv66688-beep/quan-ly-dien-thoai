FROM tomcat:9.0
RUN rm -rf /usr/local/tomcat/webapps/*
COPY target/2274820066_NguyenVanTien_xaydungwebsitequangcaovabandienthoaididongtrenmang-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]

