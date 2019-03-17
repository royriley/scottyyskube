Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.network "private_network", ip: "192.168.50.4"
  config.vm.synced_folder "~/src", "/src"
  config.vm.synced_folder "./scripts", "/home/vagrant/scripts"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end
  config.vm.provision "shell", path: "./install/docker.sh", name: "Docker"
  config.vm.provision "shell", path: "./install/minikube.sh", name: "Minikube"
  config.vm.provision "shell", path: "./install/kubectl.sh", name: "Kubectl"
  config.vm.provision "shell", path: "./install/helm.sh", name: "Helm"
  config.vm.provision "shell", path: "./install/scripts.sh", name: "Scripts", privileged: false
end
