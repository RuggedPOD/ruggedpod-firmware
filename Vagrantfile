# -*- mode: ruby -*-
# vi: set ft=ruby :

$auto_root = <<SCRIPT
echo '
cd /vagrant
sudo su' >> /home/vagrant/.bashrc
SCRIPT

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/trusty64'

  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--memory', '1024']
  end

  # Install requirements
  config.vm.provision "shell", path: 'scripts/install.sh'

  # Automatically log as root and go into the project folder when 'vagrant ssh'
  config.vm.provision "shell", inline: $auto_root
end
