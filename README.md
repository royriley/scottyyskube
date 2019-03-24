### scottyskube
Vagrant and Kubernetes setup for general use, but also ScottysBuying

**Before you begin:**
Be sure you have installed VirtualBox and Vagrant.

Set an environment variable `SCOTTYS_SRC` to a folder that will by synced to
the vagrant development environment.  I use the following in my `.bash_profile`:
```export SCOTTYS_SRC=~/src```

**Usage:**
Start vagrant (if no VM exists, provision it -- see destroy below)
```vagrant up```

Connect to your virtual machine
```vagrant ssh```

Finish starting up services (minikube and helm)
```sudo start.sh```

When you're done working, you can halt the virtual machine to save resources:
```vagrant halt```

If you want to start over with a new VM (this could lead to data-loss):
```vagrant destory```
