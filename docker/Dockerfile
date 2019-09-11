FROM ubuntu:18.04

MAINTAINER Roman version: 0.0.1

RUN apt-get update && apt-get install -y python3-pip && apt-get clean && rm -rf /var/lib/apt/lists/* && pip3 install -U awscli
