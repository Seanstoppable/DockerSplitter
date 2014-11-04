FROM dockerfile/java:oracle-java7

RUN apt-get update && \
  apt-get install -y wget && \
  apt-get install -y git && \
  apt-get clean && \
  wget "https://dl.bintray.com/sbt/debian/sbt-0.13.6.deb" && \
  dpkg -i sbt-0.13.6.deb && \
  rm sbt-0.13.6.deb && \
  git clone https://github.com/Seanstoppable/splitter.git --branch assembly --single-branch --depth 1 /usr/share/splitter

WORKDIR /usr/share/splitter

RUN  sbt clean assembly && \
    mv target/scala-2.11/splitter-assembly*.jar target/splitter-fatjar.jar

EXPOSE 7501

