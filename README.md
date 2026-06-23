# Terraform Multiple Region EC2 Deployment

## Project Overview

This project demonstrates how to use Terraform to create and manage AWS EC2 instances across multiple AWS regions using Infrastructure as Code (IaC).

Instead of manually launching instances from the AWS Management Console, Terraform allows us to automate the entire process using configuration files.

This project is designed for beginners who want to learn:

* Terraform Basics
* AWS Provider Configuration
* Multi-Region Infrastructure Deployment
* Infrastructure as Code (IaC)
* Terraform Commands
* AWS EC2 Instance Provisioning

---

# What This Project Does

The Terraform configuration:

* Connects to AWS using Terraform Providers
* Creates an EC2 instance in US East (N. Virginia)
* Creates another EC2 instance in US West (Oregon)
* Manages infrastructure through code
* Allows easy updates and deletion of resources

---

# Architecture

```text
                    Terraform
                        │
        ┌───────────────┴───────────────┐
        │                               │
        ▼                               ▼

    AWS Region                    AWS Region
    us-east-1                     us-west-2

        │                               │
        ▼                               ▼

    EC2 Instance                  EC2 Instance
```

---

# Project Structure

```text
terraform_Multiple_Region/
│
├── main.tf
├── .terraform.lock.hcl
├── .gitignore
└── README.md
```

## File Description

| File                | Purpose                                         |
| ------------------- | ----------------------------------------------- |
| main.tf             | Main Terraform configuration                    |
| .terraform.lock.hcl | Locks provider versions                         |
| .gitignore          | Prevents unnecessary files from being committed |
| README.md           | Project documentation                           |

---

# Prerequisites

Before running this project, make sure you have:

## 1. AWS Account

Create an AWS account:

https://aws.amazon.com

---

## 2. AWS CLI Installed

Verify installation:

```bash
aws --version
```

---

## 3. Terraform Installed

Verify installation:

```bash
terraform version
```

---

## 4. Configure AWS Credentials

Run:

```bash
aws configure
```

Provide:

```text
AWS Access Key ID
AWS Secret Access Key
Default Region
Output Format
```

Example:

```text
AWS Access Key ID: **********
AWS Secret Access Key: **********
Default Region: us-east-1
Output Format: json
```

---

# Terraform Configuration

Example Provider Configuration:

```hcl
provider "aws" {
  alias  = "east"
  region = "us-east-1"
}

provider "aws" {
  alias  = "west"
  region = "us-west-2"
}
```

Example EC2 Instance:

```hcl
resource "aws_instance" "east_server" {
  provider      = aws.east
  ami           = "ami-xxxxxxxx"
  instance_type = "t2.micro"
}

resource "aws_instance" "west_server" {
  provider      = aws.west
  ami           = "ami-xxxxxxxx"
  instance_type = "t2.micro"
}
```

---

# Terraform Commands

## Initialize Terraform

Downloads providers and prepares the working directory.

```bash
terraform init
```

---

## Validate Configuration

Checks for syntax errors.

```bash
terraform validate
```

---

## Preview Changes

Shows what Terraform will create.

```bash
terraform plan
```

---

## Create Infrastructure

Launches AWS resources.

```bash
terraform apply
```

For automatic approval:

```bash
terraform apply -auto-approve
```

---

## View Resources

```bash
terraform state list
```

---

## Show Resource Details

```bash
terraform show
```

---

## Destroy Infrastructure

Deletes all resources created by Terraform.

```bash
terraform destroy
```

For automatic approval:

```bash
terraform destroy -auto-approve
```

---

# Terraform Workflow

```text
Write Code
    ↓
terraform init
    ↓
terraform validate
    ↓
terraform plan
    ↓
terraform apply
    ↓
Infrastructure Created
```

---

# Important Files To Ignore

Terraform generates files that should not be pushed to GitHub.

Create a `.gitignore` file:

```gitignore
.terraform/
*.tfstate
*.tfstate.*
terraform.tfvars
terraform.tfvars.json
crash.log
```

---

# Common Errors

## Large File Error While Pushing

Error:

```text
File exceeds GitHub's 100MB limit
```

Cause:

```text
.terraform directory committed to Git
```

Solution:

```bash
rm -rf .terraform
```

Add `.terraform/` to `.gitignore`.

---

## AWS Credentials Error

Error:

```text
No valid credential sources found
```

Solution:

```bash
aws configure
```

---

## Provider Not Found

Solution:

```bash
terraform init
```

---

# Learning Outcomes

After completing this project, you will understand:

* Infrastructure as Code (IaC)
* Terraform Providers
* AWS EC2 Deployment
* Multi-Region Infrastructure
* Terraform State Management
* GitHub Best Practices for Terraform Projects

---

# Useful Commands

```bash
terraform init
terraform validate
terraform fmt
terraform plan
terraform apply
terraform show
terraform state list
terraform destroy
```

---

# Author

Om Yengantiwar

B.Tech CSE (AI & ML)

Learning AWS, Terraform, Linux, Docker, and DevOps.

GitHub:
https://github.com/OM0126
