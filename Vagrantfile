# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

UBUNTU_20    = 'bento/ubuntu-20.04'
MY_UBUNTU_20 = 'ubuntu20-jpgui'
AMAZONLINUX2 = 'bento/amazonlinux-2'

vm_specs = [
  #{ vagrant_box: UBUNTU_20,    name: 'fuji-01', ip: '192.168.1.11', cpus: 2, memory: 512*8, gui: true },
  { vagrant_box: MY_UBUNTU_20, name: 'fuji-02', ip: '192.168.1.12', cpus: 2, memory: 512*8, gui: true },
]

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  ##############################################################################
  # 共通
  ##############################################################################
  config.vm.synced_folder '.', '/vagrant', disabled: true

  ##############################################################################
  # 各VM
  ##############################################################################
  vm_specs.each do |spec|
    config.vm.define spec[:name] do |machine|
      machine.vm.box      = spec[:vagrant_box]
      machine.vm.hostname = spec[:name]
      machine.vm.network 'private_network', ip: spec[:ip]
      machine.vm.provider :virtualbox do |vb|
        vb.name   = "#{Pathname.pwd.basename}-#{spec[:name]}"
        vb.cpus   = spec[:cpus]
        vb.memory = spec[:memory]
        vb.gui    = spec[:gui]
        vb.customize ['modifyvm', :id, '--graphicscontroller', 'VMSVGA']
        vb.customize ['modifyvm', :id, '--accelerate3d', 'off']
        vb.customize ['modifyvm', :id, '--vrde', 'off']
        vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
      end
    end
  end
  ##############################################################################
  # $ vagrant plugin install vagrant-hostmanager
  # 共通：vagrant-hostmanager pluginで各VM同士がhost名でアクセス可能
  ##############################################################################
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true
end
