# ---------- Stage 1: Build WAR ----------
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
# Tùy chọn: bỏ test cho nhanh
RUN mvn -DskipTests clean package

# ---------- Stage 2: Run with Tomcat ----------
# Dự án dùng jakarta.* => chạy Tomcat 10.x (Servlet 6)
FROM tomcat:10.1-jdk17-temurin

# Xóa webapp mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR đã build sang ROOT.war để truy cập ở "/"
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Tomcat lắng nghe 8080 trong container
EXPOSE 8080
CMD ["catalina.sh", "run"]
