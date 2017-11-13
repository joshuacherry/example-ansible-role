# example-ansible-inspec

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://travis-ci.org/joshuacherry/example-ansible-inspec.svg?branch=master)](https://travis-ci.org/joshuacherry/example-ansible-inspec)

Configures [something](https://google.com/) on a server. More info here.

## Requirements

- none

## Install

### Install from GitHub

`ansible-galaxy install git+https://github.com/joshuacherry/example-ansible-inspec.git`

## Features

- something
- Support different options on different platforms

| OS            | Option 1      |
| :------------ | :-----------: |
| Debian 8      | ✓             |
| Ubuntu 16.04  | ✓             |
| Centos 7      | ✓             |

- something 3

## Versioning

[Semantic Versioning](http://semver.org/)

For the versions available, see the [tags on this repository](https://github.com/joshuacherry/example-ansible-inspec/tags).

Additionaly you can see what change in each version in the [CHANGELOG.md](CHANGELOG.md) file.

## Role variables

Look to the [defaults](defaults/main.yml) properties file to see the possible configuration properties.

## Testing

This role includes a Vagrantfile used with a Docker-based test harness that approximates the Travis CI setup for integration testing. Using Vagrant allows all contributors to test on the same platform and avoid false test failures due to untested or incompatible docker versions.

1. Install [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/).
1. Run `vagrant up` from the same directory as the Vagrantfile in this repository.
1. SSH into the VM with: `vagrant ssh`
1. Run tests with `make`.

### Testing with Docker and inspec

```bash
make -C /vagrant xenial64 test
```

See `make help` for more information including a full list of available targets.

## Example Playbook

```yaml
---
- name: Playbook for example-ansible-inspec
  hosts: all

  tasks:
  - include_role:
      name: example-ansible-inspec
```