This project demonstrate the possibility of using Elastic Stack to monitoring sites.

# Commands

## Terraform

- init: 'terraform init'

- plan: 'terraform plan'

- apply: 'terraform apply'

- destroy: 'terraform destroy'


## Server

- login: `ssh ubuntu@(terraform output ip)`

- install docker:

    ```
    sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    sudo apt-key fingerprint 0EBFCD88

    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

    sudo apt-get update
    sudo apt-get install -y docker-ce

    sudo usermod -a -G docker $USER
    ```

# Reference

1. [deviantony/docker-elk](https://github.com/deviantony/docker-elk)