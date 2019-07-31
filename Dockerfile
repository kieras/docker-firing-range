FROM ubuntu:bionic

RUN apt-get update && apt-get install -y -qq wget unzip ant git openjdk-8-jdk && apt-get clean

RUN wget https://storage.googleapis.com/appengine-sdks/featured/appengine-java-sdk-1.9.76.zip && unzip appengine-java-sdk-1.9.76.zip && rm appengine-java-sdk-1.9.76.zip

RUN update-java-alternatives --set java-1.8.0-openjdk-amd64

WORKDIR appengine-java-sdk-1.9.76/demos/

RUN git clone https://github.com/google/firing-range

WORKDIR firing-range/

RUN cp ../../jetty94/jetty-home/lib/servlet-api-3.1.jar ../../lib/shared/

EXPOSE 8080 5050

CMD ["ant","-Daddress=0.0.0.0","runserver"]
