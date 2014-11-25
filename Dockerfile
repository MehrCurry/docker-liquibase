FROM dockerfile/java

WORKDIR /opt
ADD http://sourceforge.net/projects/liquibase/files/Liquibase%20Core/liquibase-3.3.0-bin.tar.gz/download /opt/liquibase.tar.gz

RUN mkdir liquibase && tar xzvf liquibase.tar.gz -C /opt/liquibase && rm liquibase.tar.gz

ADD http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.34/mysql-connector-java-5.1.34.jar /opt/jdbc/
ADD http://central.maven.org/maven2/org/mariadb/jdbc/mariadb-java-client/1.1.7/mariadb-java-client-1.1.7.jar /opt/jdbc/
ADD http://central.maven.org/maven2/com/h2database/h2/1.4.182/h2-1.4.182.jar /opt/jdbc/
ADD http://central.maven.org/maven2/org/postgresql/postgresql/9.3-1102-jdbc41/postgresql-9.3-1102-jdbc41.jar /opt/jdbc/
ADD http://central.maven.org/maven2/org/apache/derby/derbyclient/10.11.1.1/derbyclient-10.11.1.1.jar /opt/jdbc/

ENTRYPOINT [ "java", "-classpath", "jdbc/*:liquibase/liquibase.jar", "liquibase.integration.commandline.Main" ]

CMD --help