FROM ubuntu:20.04

RUN apt-get update && apt-get install -y wget && apt-get clean && rm -rf /var/lib/apt/lists/* && wget --directory-prefix=/user/local/bin https://github.com/xmseed234/torrent-check/releases/latest 
