# vim: set ft=dockerfile:

FROM ubuntu:xenial

# Colour output.
ENV TERM=xterm

RUN apt-get update -y \
    && apt-get install -y software-properties-common \
    && apt-add-repository ppa:ansible/ansible \
    && apt-get update -y \
    && apt-get --no-install-recommends install -y \
      ansible \
      wget \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://packages.chef.io/files/stable/inspec/1.23.0/ubuntu/16.04/inspec_1.23.0-1_amd64.deb \
    && dpkg -i inspec_1.23.0-1_amd64.deb \
    && rm inspec_1.23.0-1_amd64.deb
