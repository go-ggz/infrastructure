# infrastructure

GGZ: Infrastructure

## Platform

* [AWS](https://aws.amazon.com/)

# How to use

Please visit this web page and choose your OS. See [Terraform download page](https://www.terraform.io/downloads.html).

## Setup AWS Credentials

create `terraform.tfvars` and add the following setting:

```
aws_access_key  = "xxxx"
aws_secret_key  = "xxxx"
aws_vpc_id      = "xxxx"
aws_subnet_id_a = "xxxx"
aws_subnet_id_c = "xxxx"
```

## Build Infrastructure

```sh
$ terraform init
```

## Change Infrastructure

```sh
$ terraform apply
```

## Destroy Infrastructure

```sh
$ terraform destroy
```
