FROM emscripten/emsdk:1.40.1
WORKDIR /app
USER root
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup-init.sh \
      && sh ./rustup-init.sh -y -t wasm32-unknown-emscripten
RUN apt update -y \
      && apt install -y libclang-dev gcc-multilib g++-multilib automake libtool make gcc pkg-config python3 lzip

COPY ocrad-0.25.tar.bz2 .

COPY src/post.js src/post.js
COPY src/pre.js src/pre.js
COPY src/generate.py src/generate.py
COPY build.sh .

RUN tar -xjvf ocrad-0.25.tar.bz2

RUN ./build.sh
