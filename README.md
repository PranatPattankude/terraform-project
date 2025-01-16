# AWS VPC and EC2 Infrastructure Setup Using Terraform

This project demonstrates the setup of a simple AWS VPC-based infrastructure using Terraform. The infrastructure includes a Virtual Private Cloud (VPC), public subnet, internet gateway, route table, security group, and an EC2 instance configured with Apache HTTP Server. Below is an overview of the resources and configurations provided in this project.

## Resources and Configuration

### 1. **Virtual Private Cloud (VPC)**
- **Resource**: `aws_vpc`
- **CIDR Block**: `172.20.0.0/16` (customizable via `vpc_cidr` variable)
- **Purpose**: Acts as the foundational network for other AWS resources.

### 2. **Public Subnet**
- **Resource**: `aws_subnet`
- **CIDR Block**: `172.20.1.0/24` (customizable via `pub_sub` variable)
- **Availability Zone**: `us-east-1a` (configurable)
- **Purpose**: Hosts public-facing resources such as the EC2 instance.

### 3. **Internet Gateway**
- **Resource**: `aws_internet_gateway`
- **Purpose**: Allows the resources in the public subnet to connect to the internet.

### 4. **Route Table**
- **Resource**: `aws_route_table`
- **Route**: `0.0.0.0/0` through the internet gateway (customizable via `RT-cidr` variable)
- **Purpose**: Ensures internet access for the public subnet.

### 5. **Route Table Association**
- **Resource**: `aws_route_table_association`
- **Purpose**: Associates the public subnet with the route table.

### 6. **Security Group**
- **Resource**: `aws_security_group`
- **Ingress Rules**: Allows SSH (port 22) and HTTP (port 80) access.
- **Egress Rules**: Allows unrestricted outbound traffic.
- **CIDR and Ports**: Customizable via `sg-cidr`, `ingress-port`, and `egress-port` variables.

### 7. **EC2 Instance**
- **Resource**: `aws_instance`
- **AMI**: Amazon Linux 2 (`ami-0182f373e66f89c85`)
- **Instance Type**: `t2.micro`
- **Configuration**:
  - Automatically installs and starts Apache HTTP Server.
  - Enables Apache to start on boot.
- **Outputs**: Public IP and SSH access details are exposed via Terraform outputs.

### 8. **Outputs**
- `instance_ip`: Public IP of the EC2 instance.
- `instance_ip_url`: Public URL of the EC2 instance (`https://<instance_ip>`).
- `SSH_login`: SSH command to access the instance.

## Prerequisites
- Terraform installed on your local system.
- AWS credentials configured in your environment.
- Sufficient IAM permissions to create resources in AWS.

## Usage

1. **Initialize Terraform**:
   ```bash
   terraform init

2. **Review and validate the configuration**:
   ```bash
   terraform plan

3. **Apply the configuration to deploy resources**:
   ```bash
   terraform apply

4. **Note the output values for accessing the EC2 instance and application**.


## To clone this
1. Clone this repository:
   ```bash
   git clone <repository_url>
   cd <repository_directory>

