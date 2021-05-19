# Yandex Cloud usage with Terraform
Those repository is a result of task 11.4 on Skillfactory courses.

## Before you start

Once you clonned repository, few more things should be done:

* Make sure that [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) is installed
* Make sure that [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) is insalled
* Make sure that [kubectl](https://kubernetes.io/docs/tasks/tools/) installed locally
* You need to create 2 files:

- ```vars.tf``` with filled default variables:
```
variable "token" {
  type    = string
  default = "YOUR_YANDEX_CLOUD_TOKEN"
}

variable "cloud_id" {
  type    = string
  default = "YOUR_YANDEX_CLOUD_ID"
}

variable "folder_id" {
  type    = string
  default = "YOUR_YANDEX_CLOUD_ID"
}

variable "zone" {
  type    = string
  default = "YOUR_YANDEX_CLOUD_ZONE"
}

variable "image_id" {
  type    = string
  default = "YOUR_YANDEX_CLOUD_IMAGE_ID"
}

variable "subnet_id" {
  type    = string
  default = "YOUR_YANDEX_CLOUD_SUBNET_ID"
}
```

- ```ansible.cfg``` in ```playbook/``` directory:

```
[defaults]
private_key_file = PATH_TO_YOUR_PRIVATE_KEY
host_key_checking = False
inventory = hosts
remote_user = YOUR_USER_ON_TARGET_HOST
```
____

## How to use?
1. Run ```terraform init``` to initialize terraform providers
2. Run ```terraform apply``` to ad setup VM instances
3. Terraform will automatically prepare inventory file for a ansible purposes. You can check it manually by ```cat playbook/hosts```

   > Due the fact the yandex providing IP address before SSH agent (I guess) was started, it's better to ping one of the output IPs before proceed to next step.

4. Now you need to move into ```playbook``` directory and run ```ansible-playbook setup.yml```
5. On the latest step ansible will show you token, required to login onto **Dashboard**
6. Run ```kubectl proxy``` locally
7. Login to [Dashboard](http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/) with your token

