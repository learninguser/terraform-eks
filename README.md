# terraform-eks

A sample repository to create EKS on AWS using Terraform.

## Installation steps

### Install AWS CLI

As the first step, you need to install AWS CLI as we will use the AWS CL (`aws configure`) command to connect Terraform with AWS in the next steps.

Follow the below link to Install AWS CLI.

```sh
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
```

### Install Terraform

Next, Install Terraform using the below link.

```sh
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
```

### Connect Terraform with AWS

Its very easy to connect Terraform with AWS. Run `aws configure` command and provide the AWS Security credentials as shown in the video.

### Initialize Terraform

Clone the repository and Run `terraform init`. This will initialize the terraform environment for you and download the modules, providers and other configuration required.

### Optionally review and apply the terraform configuration

- Run `terraform plan` to see the configuration it creates when executed.
- To apply terraform configuration to create EKS cluster with VPC, run: `terraform apply`

### Once the cluster is created, use the following command to establish communication with the Kube-api server

```sh
aws eks update-kubeconfig --name <cluster-name> --region <region> --profile <default>
```
