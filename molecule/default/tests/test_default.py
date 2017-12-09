"""
Runs Default tests
Available Modules: http://testinfra.readthedocs.io/en/latest/modules.html

"""
import os
import testinfra.utils.ansible_runner

TESTINFRA_HOSTS = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_hosts_file(host):
    """
    Tests that the hosts file exists
    """
    file = host.file('/etc/hosts')

    assert file.exists
    assert file.user == 'root'
    assert file.group == 'root'


def test_nginx_is_installed(host):
    """
    Tests that nginx is installed
    """
    os_family = host.ansible("setup")["ansible_facts"]["ansible_os_family"]
    if os_family == "RedHat":
        nginx_package = "nginx"
    elif os_family == "Debian":
        nginx_package = "nginx"

    nginx = host.package(nginx_package)
    assert nginx.is_installed


def test_nginx_running_and_enabled(host):
    """
    Tests that nginx is running and enabled
    """
    nginx = host.service("nginx")
    assert nginx.is_running
    assert nginx.is_enabled
