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
      net-tools \
      ruby2.3 \
      ruby-dev \
      make \
      gcc \
      libffi-dev \
      build-essential \
      rubygems-integration \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN gem2.3 update --system
RUN gem2.3 install rake
RUN gem2.3 install inspec
