# vim: set ft=dockerfile:

FROM ubuntu:trusty

# Colour output.
ENV TERM=xterm

RUN apt-get update -y \
    && apt-get install -y software-properties-common \
    && apt-add-repository ppa:ansible/ansible \
    && apt-get update -y \
    && apt-get --no-install-recommends install -y \
      ansible \
      git \
      net-tools \
      ruby2.0 \
      ruby2.0-dev \
      make \
      gcc \
      libffi-dev \
      build-essential \
      rubygems-integration \
      sudo \
      tar \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN gem2.0 update --system
RUN gem2.0 install rake
RUN gem2.0 install inspec
