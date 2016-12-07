FROM hub.c.163.com/public/ubuntu:14.04
ADD ./ /h2o
WORKDIR /h2o
RUN apt-get update --yes &&\
    apt-get install --yes software-properties-common &&\
    add-apt-repository --yes ppa:ubuntu-toolchain-r/test &&\
    apt-add-repository --yes ppa:smspillaz/cmake-2.8.12 &&\
    apt-get --yes update &&\
    apt-get install --yes cmake cmake-data g++-4.8 libstdc++-4.8-dev php5-cgi wget &&\
    if [ \"$CXX\" = \"g++\" ]; then export CXX=\"g++-4.8\"; fi &&\
    apt-get install -qq cpanminus libipc-signal-perl liblist-moreutils-perl libwww-perl libio-socket-ssl-perl zlib1g-dev &&\
    cmake -DWITH_MRUBY=ON . &&\
    make all &&\
    make install

