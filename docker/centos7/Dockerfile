FROM centos:7

ENV TERM=xterm

RUN yum install -y epel-release \
    && yum install -y \
      ansible \
    && yum clean all

COPY chef.asc /tmp/chef.asc
COPY chef-stable.list /etc/yum.repos.d/chef-stable.repo

RUN rpm --import /tmp/chef.asc \
    && yum install -y inspec-1.25.0-1.el7
