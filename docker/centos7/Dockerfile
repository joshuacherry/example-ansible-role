FROM centos:7

ENV TERM=xterm

RUN yum install -y epel-release \
    && yum install -y \
      ansible \
      wget \
    && yum clean all

RUN wget https://packages.chef.io/files/stable/inspec/1.23.0/el/7/inspec-1.23.0-1.el7.x86_64.rpm \
    && rpm -i inspec-1.23.0-1.el7.x86_64.rpm \
    && rm inspec-1.23.0-1.el7.x86_64.rpm
