if ENV['SCOTTYS_SRC'].to_s.strip == ''
  puts <<-EOS
  ERROR: SCOTTYS_SRC environment variable not set.
  Export the environment variable SCOTTYS_SRC in your shell
  EOS
  exit
end

unless File.directory?(ENV['SCOTTYS_SRC'])
  puts <<-EOS
  ERROR: SCOTTYS_SRC (#{ENV['SCOTTYS_SRC']}) is not a directory.
  EOS
  exit
end

puts "SYNCING #{ENV['SCOTTYS_SRC']} on host to /src on guest"

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.network "private_network", ip: "192.168.50.4"
  config.vm.synced_folder ENV['SCOTTYS_SRC'], "/src"
  config.vm.synced_folder "./scripts", "/home/vagrant/scripts"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 4
    v.customize ["modifyvm", :id, "--audio", "none"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end
  config.vm.provision "shell", path: "./install/docker.sh", name: "Docker"
  config.vm.provision "shell", path: "./install/minikube.sh", name: "Minikube"
  config.vm.provision "shell", path: "./install/kubectl.sh", name: "Kubectl"
  config.vm.provision "shell", path: "./install/helm.sh", name: "Helm"
  config.vm.provision "shell", path: "./install/scripts.sh", name: "Scripts", privileged: false
end
