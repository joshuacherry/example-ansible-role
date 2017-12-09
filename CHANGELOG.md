# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

| Change Type   | Description                            |
| :------------ | :------------------------------------- |
| Added         | for new features.                      |
| Changed       | for changes in existing functionality. |
| Deprecated    | for soon-to-be removed features.       |
| Removed       | for now removed features.              |
| Fixed         | for any bug fixes.                     |
| Security      | in case of vulnerabilities.            |

## [Unreleased]

## [2.0.0] - 2017-12-08

### Added

- Vagrant private_network with dhcp
- Vagrant mount options to support macs and executable files
- Molecule for testing

### Changed

- changed Vagrant synced_folder to `/example-ansible-role/`
- changed role name to be more software agnostic

### Removed

- Dockerfiles from old test framework
- Makefile
- Debian 8 support

## [1.0.3] - 2017-11-13

### Added

- Added Changelog

### Changed

- Updated Readme with Ansible version requirement
- Renamed license file

[Unreleased]: https://github.com/joshuacherry/example-ansible-role/compare/2.0.0...HEAD
[2.0.0]: https://github.com/joshuacherry/example-ansible-role/compare/1.0.3...2.0.0
[1.0.3]: https://github.com/joshuacherry/example-ansible-role/compare/1.0.2...1.0.3