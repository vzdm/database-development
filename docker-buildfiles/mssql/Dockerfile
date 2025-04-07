FROM mcr.microsoft.com/mssql/server:2022-CU14-ubuntu-22.04
LABEL maintainer David Murphy <david.murphy@verizonconnect.com>

ENV ACCEPT_EULA=Y
USER root

RUN apt-get update; \
    apt-get install -y apt-transport-https && \
    apt-get update && \
    apt-get install -y dotnet-sdk-6.0 zip && \
    mkdir /opt/coverage && \
    mkdir /opt/sqlcover && \
    mkdir /opt/tsqlt && \
    wget --directory-prefix=/opt/sqlcover/ https://github.com/sayantandey/SQLServerCoverage/releases/download/v3.0/SQLServerCoverage_3.0_linux-x64.zip && \
    unzip /opt/sqlcover/SQLServerCoverage_3.0_linux-x64.zip -d /opt/sqlcover/ && \
    chmod 777 -R /opt/sqlcover && \
    rm /opt/sqlcover/SQLServerCoverage_3.0_linux-x64.zip && \
    cd /opt && \
    wget https://tsqlt.org/download/tsqlt/?version=1-0-8083-3529 -O /opt/tSQLt_V1.0.8083.3529.zip && \
    unzip -j /opt/tSQLt_V1.0.8083.3529.zip tSQLt.class.sql PrepareServer.sql -d /opt/tsqlt/ && \
    rm /opt/tSQLt_V1.0.8083.3529.zip
