# Stage 1 - the build process
from alpine:latest as base
RUN apk add git
RUN apk add build-base
RUN git clone https://github.com/xmseed234/torrent-check.git
RUN cd /torrent-check && gcc -O torrentcheck.c sha1.c -o torrentcheck && gcc -O -Dfopen=fopen64 -D_FILE_OFFSET_BITS=64 -DUSE_FTELLO torrentcheck.c sha1.c -o torrentcheck

# Stage 2 - the deploy process
FROM alpine:latest
COPY --from=base /torrent-check/torrentcheck /usr/local/bin
