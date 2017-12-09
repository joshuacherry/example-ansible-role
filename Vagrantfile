# Defines our Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
ROOT_FOLDER = File.basename(__dir__)

$setupScript = <<SCRIPT
echo provisioning docker...
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common bash-completion
sudo apt-get install python3-pip -y && sudo pip3 install --upgrade pip && sudo pip install pyyaml
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
apt-get -y -o Dpkg::Options::="--force-confold" install ansible
# Show available version apt-cache madison docker-ce
sudo apt-get -o Dpkg::Options::="--force-confnew" install --force-yes -y docker-ce="17.03.1~ce-0~ubuntu-xenial"
sudo usermod -a -G docker vagrant
sudo pip install docker-compose==1.13.0
sudo pip install molecule

docker version

docker-compose version

molecule --version
echo "###########################################"
echo "#                IP ADDRESS               #"
echo "#                                         #"
ip a | grep brd | egrep "[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\/[[:digit:]]{1,2}" | awk '{print "               ",$2}'
echo "###########################################"
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.synced_folder ".", "/"+ROOT_FOLDER,
  owner: "vagrant", group: "vagrant",
  mount_options: ["dmode=777,fmode=777"]
  config.vm.define "server" do |host|
    host.vm.hostname = "server"
    config.vm.network "private_network", type: "dhcp"
    host.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = "1"
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
    end
    host.vm.provision :shell, :inline => $setupScript
  end
end
