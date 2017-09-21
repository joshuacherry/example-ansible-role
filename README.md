# example-ansible-inspec

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

[![Build Status](https://travis-ci.org/joshuacherry/example-ansible-inspec.svg?branch=master)](https://travis-ci.org/joshuacherry/example-ansible-inspec)

## Requirements

- none

## Install

```bash
install instructions here
```

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

## Role variables

The following variable defaults are defined in `defaults/main.yml`.

`variable1`
Description

## Contributing

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

## License

The MIT License (MIT)

Copyright (c) 2017 Joshua Cherry

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
