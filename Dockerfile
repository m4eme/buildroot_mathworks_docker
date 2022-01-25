# Create Ubuntu as base image
FROM ubuntu:16.04

#Install packages
RUN apt update
RUN apt install -y vim
RUN apt install -y build-essential
RUN apt install -y git
RUN apt install -y wget
RUN apt install -y python
RUN apt install -y cpio
RUN apt install -y bc
RUN apt install -y unzip
RUN rm -rf /var/lib/apt/lists/*
RUN mkdir -p /opt/linaro

# Download Linaro for 32-bit and 64-bit targets
RUN wget https://releases.linaro.org/components/toolchain/binaries/6.3-2017.02/arm-linux-gnueabihf/gcc-linaro-6.3.1-2017.02-x86_64_arm-linux-gnueabihf.tar.xz
RUN wget https://releases.linaro.org/components/toolchain/binaries/6.3-2017.02/aarch64-linux-gnu/gcc-linaro-6.3.1-2017.02-x86_64_aarch64-linux-gnu.tar.xz

# Extract the 32-bit toolchain and rename the folder
RUN tar -C /opt/linaro/ -xvJf gcc-linaro-6.3.1-2017.02-x86_64_arm-linux-gnueabihf.tar.xz
RUN mv /opt/linaro/gcc-linaro-6.3.1-2017.02-x86_64_arm-linux-gnueabihf /opt/linaro/aarch32-6.3.1-2017.02
RUN rm gcc-linaro-6.3.1-2017.02-x86_64_arm-linux-gnueabihf.tar.xz

# Extract the 64-bit toolchain and rename the folder
RUN tar -C /opt/linaro -xvJf gcc-linaro-6.3.1-2017.02-x86_64_aarch64-linux-gnu.tar.xz
RUN mv /opt/linaro/gcc-linaro-6.3.1-2017.02-x86_64_aarch64-linux-gnu /opt/linaro/aarch64-6.3.1-2017.02
RUN rm gcc-linaro-6.3.1-2017.02-x86_64_aarch64-linux-gnu.tar.xz

#Run as non-root
RUN useradd -u 8877 mw_user
RUN mkdir /home/mw_user
RUN chown mw_user:mw_user /home/mw_user
USER mw_user
WORKDIR /home/mw_user
