FROM ubuntu:18.04
MAINTAINER Lawrence-Tang <tangzongsheng@gmail.com>

# cn source
COPY ./files/sources-1804.list /etc/apt/sources.list
RUN apt-get update; apt-get install -y openjdk-8-jdk bc python rsync \
    git-core gnupg flex bison gperf build-essential \
    zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
    lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
    libgl1-mesa-dev libxml2-utils xsltproc unzip \
    busybox u-boot-tools cpio gawk


RUN echo "root:fa" | chpasswd
USER root
ENV USER root
ADD http://112.124.9.243/docker-files/java-7u171-openjdk-amd64.tgz /usr/lib/jvm/
RUN tar xzf /usr/lib/jvm/java-7u171-openjdk-amd64.tgz -C /usr/lib/jvm/ && rm -f /usr/lib/jvm/java-7u171-openjdk-amd64.tgz
ADD http://112.124.9.243/docker-files/sun-jdk-6u45.tgz /usr/lib/jvm/
RUN tar xzf /usr/lib/jvm/sun-jdk-6u45.tgz -C /usr/lib/jvm/ && rm -f /usr/lib/jvm/sun-jdk-6u45.tgz

RUN echo "all done."
