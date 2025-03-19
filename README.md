# Infrastructure as Code (IaC) with Terraform
This repository contains Terraform modules used to provision different resource infrastructure on AWS and Azure for dev, stage, and prod environments.

## Directory Structure
```
.
├── environments
│   ├── dev
|   │   ├── main.tf
│       ├── variables.tf
│       ├── terraform.tfvars
│       └── outputs.tf
│   ├── stage
│   ├── prod
├── aws
│   └── modules
│       ├── vpcs
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   ├── providers.tf
│       │   └── outputs.tf
│       ├── ec2s
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   ├── providers.tf
│       │   └── outputs.tf
│       ├── s3
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   ├── providers.tf
│       │   └── outputs.tf
├── Azure
│   └── modules
│       ├── vnets
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   ├── providers.tf
│       │   └── outputs.tf
│       ├── vms
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   ├── providers.tf
│       │   └── outputs.tf
```

## Usage

Depending on the environment in which you want to provision resources, navigate into the corresponding directory within `environments`. Execute Terraform commands from within the applicable directory.

### Example

1. Navigate to your environment:
    ```shell
    cd environments/dev
    ```

2. Initialize your Terraform workspace, which will download the provider plugins:
    ```shell
    terraform init
    ```

3. Validate your Terraform code to check for errors:
    ```shell
    terraform validate
    ```

4. View the actions that will be performed by Terraform:
    ```shell
    terraform plan
    ```

5. Provision the resources:
    ```shell
    terraform apply
    ```

## Modules

The `main.tf` file within each module calls the Terraform AWS or Azure provider to interact with your AWS or Azure account.

The `variables.tf` file defines the variables that you can pass in when calling the modules to customize its behavior.

The `outputs.tf` file defines any values that will be exported as outputs when the module is used.

The VPC module will create a VPC and associated resources necessary for the environment. It will create the required EIP and NAT gateway for internet access.

## Requirements

- Terraform 1.0+
- AWS provider >  5.0+
- Azure provider > 4.0+

## Author

Aniket Sangohi