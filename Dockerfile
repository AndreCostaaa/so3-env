FROM ubuntu:latest 

RUN dpkg --add-architecture i386
RUN apt update
RUN apt install libc6:i386 libncurses5:i386 libstdc++6:i386
RUN apt install lib32z1-dev
RUN apt install zlib1g:i386
RUN apt install pkg-config libgtk2.0-dev bridge-utils
RUN apt install unzip bc
RUN apt install elfutils u-boot-tools
RUN apt install device-tree-compiler
RUN apt install fdisk
RUN apt install libncurses-dev
RUN apt install flex bison

RUN apt install gcc-arm-none-eabi

RUN wget https://github.com/smartobjectoriented/so3/archive/refs/heads/main.zip; \
RUN unzip main.zip
RUN rm main.zip
RUN mv so3-* so3

RUN cd so3/qemu
RUN ./fetch.sh
RUN ./configure --target-list=arm-softmmu,aarch64-softmmu --disable-attr --disable-werror --disable-docs
RUN cd ..
RUN mv qemu /qemu
RUN rm -rf so3

WORKDIR so3
