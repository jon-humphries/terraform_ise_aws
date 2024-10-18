
# Cisco ISE Deployment in AWS using Terraform

This project provides Terraform configurations to automate the deployment of **Cisco Identity Services Engine (ISE)** in **AWS**. It provisions EC2 instances, sets up networking components (VPC, subnets, security groups), and configures necessary resources to run Cisco ISE in a cloud environment.

Author: Jon Humphries - jonhumph@cisco.com
Original Author: Greg Gibbbs - grgibbs@cisco.com

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
  - [1. Clone the Repository](#1-clone-the-repository)
  - [2. Customize the Terraform Variables](#3-customize-the-terraform-variables)
  - [3. Initialize and Apply Terraform](#4-initialize-and-apply-terraform)
- [Resources Created](#resources-created)
- [Resources Destroyed](#resources-destroyed)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Overview

This project automates the deployment of Cisco ISE in AWS using Terraform. It includes configurations for provisioning EC2 instances, network interfaces, EBS volumes, security groups, and more. By using this Terraform configuration, you can easily create a scalable and secure environment for running Cisco ISE in the AWS cloud.

### Features

- Automated deployment of EC2 instances with custom AMIs for Cisco ISE.
- Configurable network interfaces and security groups.
- Support for EBS volumes and custom instance types.
- User data scripts to configure ISE on the first boot.

## Prerequisites

Before you can deploy Cisco ISE in AWS using Terraform, ensure you have the following:

- **AWS Account** with appropriate permissions to create EC2 instances, VPC, subnets, security groups, etc.
- **Terraform** installed (v1.5.7 or later).
- **AWS CLI** configured on your local machine - Optional
- **Cisco ISE AMI** available in your AWS account.

### Software Requirements:

- **Terraform**: [Install Terraform](https://www.terraform.io/downloads.html)
- **AWS CLI**: [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) - Optional
- **SSH Key Pair**: You need an SSH key pair to access the instances.

### AWS Permissions

Ensure that your AWS user has the following permissions:

- `ec2:CreateInstance`
- `ec2:CreateVpc`
- `ec2:CreateSecurityGroup`
- `ec2:CreateSubnet`
- `ec2:DescribeImages`
- `ec2:AttachNetworkInterface`
- `iam:PassRole`


## Usage

### 1. Clone the Repository

First, clone this repository and navigate to the project directory:

```bash
git clone https://https://github.com/jon-humphries/terraform_ise_aws.git

```

### 2. Configure AWS Credentials

Ensure your AWS credentials are set up either using the AWS CLI (`aws configure`) or through environment variables.

```bash
export AWS_ACCESS_KEY_ID=your-access-key-id
export AWS_SECRET_ACCESS_KEY=your-secret-access-key
export AWS_DEFAULT_REGION=us-east-1
```

### 3. Customize the Terraform Variables

Edit the `terraform.tfvars` file or use environment variables to customize the values for your environment. The terraform.tfvars file needs to be created locally. It is recommended to set these as export variables in your CI or use a secure vault to access these credentials.

Example `terraform.tfvars`:

```hcl
ise_ami_3_3_us_east_1             = "ami-0b23511ddfe2744e2"
ise_ami_3_4_us_east_1             = "ami-07946ba1cee1ca94a"
iselab_az1                        = "us-east-1a"
ise_instance_type                 = "t3.xlarge"
key_name                          = "your-ssh-key-name"
subnet_id                         = "subnet-1234567890abcdef"
security_group_id                 = "sg-0123456789abcdef0"
```

### 4. Initialize and Apply Terraform

1. **Initialize Terraform**: This step will download any necessary provider plugins.

   ```bash
   terraform init
   ```

2. **Review the Plan**: Check what resources Terraform will create or modify.

   ```bash
   terraform plan
   ```

3. **Apply the Terraform Configuration**: This command will provision the resources in AWS based on your configuration.

   ```bash
   terraform apply
   ```

   Confirm the action by typing `yes` when prompted.

## Resources Created

The following resources will be created when you apply the Terraform configuration:

- EC2 instance(s) for Cisco ISE
- Elastic Network Interfaces (ENIs)
- EBS volumes for storage
- Security Groups to control access
- VPC Subnet and related networking components (optional)

## Resources Destroyed

This command will remove the resources in AWS based on your configuration.

   ```bash
   terraform destroy
   ```

   Confirm the action by typing `yes` when prompted.


## Troubleshooting

- **SSH Connection Issues**: Ensure that the correct key pair is being used and that the Security Group allows inbound SSH (port 22) traffic.
- **Instance Not Starting**: Ensure the AMI ID specified in the variables is correct and available in your region.
- **AWS Permissions**: Ensure your AWS credentials have the necessary permissions to create the resources.

For detailed logs, enable Terraform debug mode:

```bash
export TF_LOG=DEBUG
```

## Contributing

Contributions are welcome! Please fork this repository and submit a pull request if you have any improvements or bug fixes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
