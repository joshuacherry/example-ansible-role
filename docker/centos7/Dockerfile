FROM centos:7

ENV TERM=xterm

RUN yum install -y epel-release \
    && yum install -y \
      ansible \
      git \
      iproute \
      ruby \
      sudo \
      tar \
    && yum clean all

RUN gem install inspec
