# challenge1
#Example and source

**Launch Ansible Playbook to deploy a cluster with 2 vms centos**
```ansible-playbook -i inventory.yml create.yml```
**Destroy vms**
```ansible-playbook -i inventory.yml destroy.yml```

**Local path with ssl certificate for remote connection**
```/root/docker-cluster/ssl/<vm-name>/etc/docker/<cluster-name>/```
es:
```/root/docker-cluster/ssl/vm-node1/etc/docker/my-clusters/```
you can't connect to remote docker daemon without certificate 
![alt text](https://github.com/nicola-milani/challenge1/blob/master/img/without_ssl.png)

**Connect to remote docker API REST**
```export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.8.2:2376"
export DOCKER_CERT_PATH="/root/docker-cluster/ssl/vm-node1/etc/docker/my-clusters/
```
after this setup you can use remote docker daemon
![alt text](https://github.com/nicola-milani/challenge1/blob/master/img/after.png)
you can use http like this
```
curl -k -s -XGET https://192.168.8.2:2376/v1.24/containers/json?all=1 --cert /root/docker-cluster/ssl/vm-node1/etc/docker/my-clusters/cert.pem --key /root/docker-cluster/ssl/vm-node1/etc/docker/my-clusters/key.pem --cacert /root/docker-cluster/ssl/vm-node1/etc/docker/my-clusters/ca.pem | jq
```
![alt text](https://github.com/nicola-milani/challenge1/blob/master/img/curl.png)


