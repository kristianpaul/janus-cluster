FROM debian:stretch-slim

RUN  set -x \
    && apt-get update && apt-get install -y cmake build-essential aptitude git wget golang\
    && aptitude install -y libmicrohttpd-dev libjansson-dev libnice-dev \
    libssl-dev libsofia-sip-ua-dev libglib2.0-dev libopus-dev libogg-dev \
    libcurl4-openssl-dev liblua5.3-dev pkg-config gengetopt libtool automake
RUN  set -x \
    && cd  \
    && wget https://github.com/cisco/libsrtp/archive/v2.2.0.tar.gz \
    && tar xfv v2.2.0.tar.gz  \
    && cd libsrtp-2.2.0/ \
    && ./configure --prefix=/usr --enable-openssl \
    && make shared_library && make install
RUN  set -x \
    && git clone https://boringssl.googlesource.com/boringssl \
    && cd boringssl \
    && sed -i s/" -Werror"//g CMakeLists.txt \
    && mkdir -p build \
    && cd build \
    && cmake -DCMAKE_CXX_FLAGS="-lrt" .. \
    && make \
    && cd .. \
    && mkdir -p /opt/boringssl \
    && cp -R include /opt/boringssl/ \
    && mkdir -p /opt/boringssl/lib \
    && cp build/ssl/libssl.a /opt/boringssl/lib/ \
    && cp build/crypto/libcrypto.a /opt/boringssl/lib/

RUN  set -x \
    && git clone https://github.com/sctplab/usrsctp \
    && cd usrsctp \
    && ./bootstrap \
    && ./configure --prefix=/usr && make && make install

RUN  set -x \
    && git clone git://git.libwebsockets.org/libwebsockets \
    && cd libwebsockets \
    && mkdir build \
    && cd build \
    && cmake -DLWS_MAX_SMP=1 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_C_FLAGS="-fpic" .. \
    && make && make install

RUN  set -x \
    && git clone https://github.com/meetecho/janus-gateway.git \
    && cd janus-gateway \
    && sh autogen.sh \
    && ./configure --prefix=/opt/janus \
    && make \
    && make install

CMD ["/opt/janus/bin/janus -A "]
