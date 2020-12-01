FROM ubuntu:latest

# get dependencies
RUN apt-get update && apt-get install -y git build-essential
RUN git clone https://github.com/xmseed234/torrent-check.git

# build
RUN cd torrent-check
RUN gcc -O torrentcheck.c sha1.c -o torrentcheck
RUN gcc -O -Dfopen=fopen64 -D_FILE_OFFSET_BITS=64 -DUSE_FTELLO torrentcheck.c sha1.c -o torrentcheck
RUN mv ./torrentcheck /usr/local/bin/torrentcheck && cd /
RUN rm -rf /torrent-check

# clean up 
RUN apt-get purge -y git build-essential
RUN apt-get -y autoremove
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*
