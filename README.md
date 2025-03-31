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

# EC2 Instance Terraform Module

This module creates an AWS EC2 instance in the specified region, with the provided AMI ID and associated tags.

## Usage

```hcl
module "ec2_instance" {
  source  = "./ec2_module"  // Path to the module
  region  = "us-east-1"
  ami     = "ami-0c94855ba95c574c8" // Replace with your AMI ID

  tags = {
    Environment = "test"
    Name        = "test-instance"
  }
}
```

## Inputs

The following input variables are required:

- `region`: The AWS region where the EC2 instance will be created.

- `ami` : The ID of the Amazon Machine Image (AMI) to use for the EC2 instance. If not provided, the module will default to use the latest Amazon Linux 2 AMI.

- `tags`: A map of tags to assign to the EC2 instance. Valid keys are `Environment` and `Name`. The `Environment` tag is intended to specify the type of environment (e.g., "testing", "production") in which the EC2 instance is used. The `Name` tag is a human-readable name for the EC2 instance.

## Outputs

The module provides the following outputs:

- `instance_id`: The ID of the created EC2 instance.
- `public_ip`: The Public IP of the created EC2 instance.

## Setup

To use this module, follow these steps:

1. Install Terraform - Follow the instructions in the [Terraform installation guide](https://www.terraform.io/downloads.html).

2. Configure AWS credentials - Make sure that your AWS credentials are configured locally. Terraform will use these to connect to your AWS environment. Follow the instructions in the [AWS CLI Configuration Basics guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html).

3. Add the module to your Terraform configuration - Use the example usage provided above as a template. Replace the `source`, `region`, `ami`, and `tags` values with those appropriate to your environment.

4. Apply the configuration - Run `terraform init` and `terraform apply`.

## Notes

- Ensure you have necessary permissions to create resources in AWS.
- Always review your Terraform plan output before applying to ensure expected actions on resources.

Please raise an issue on Github if you encounter any problems or have a feature request.

## Author

Aniket Sangohi