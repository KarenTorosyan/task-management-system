FROM gradle:jdk21-jammy as builder
WORKDIR /opt/task-management-system
COPY . .
RUN gradle build --no-daemon --info -x test

FROM sapmachine:21-jdk-ubuntu-jammy
WORKDIR /opt/task-management-system
COPY --from=builder /opt/task-management-system/api/build/libs/task-management-system.jar ./
CMD java -jar task-management-system.jar