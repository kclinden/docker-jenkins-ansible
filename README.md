# Jenkins Ansible SSH Agent
Docker image for a Jenkins SSH Agent with Ansible installed for executing playbooks against remote hosts

## Build
```
docker build -t kaseylinden/docker-jenkins-ansible:latest .
```

## SSH Keys
If Ansible is interacting with external machines, you'll need to mount an SSH key pair for the duration of the play:
```
docker run --rm -it \
    -v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
    -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
    -v $(pwd):/ansible/playbooks \
    kaseylinden/docker-jenkins-ansible:latest site.yml
```