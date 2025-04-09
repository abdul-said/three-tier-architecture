# Three-Tier Architecture Deployment with Terraform
This project demonstrates the deployment of a scalable and secure three-tier architecture on AWS using Terraform. It showcases Infrastructure as Code (IaC) principles to provision and manage resources efficiently.

## Table of Contents:
 -  Overview

 -  Architecture Diagram

 -  Features

 -  Prerequisites

 -  Usage

 -  Project Structure

 -  Security Considerations

 -  Contributing

 -  License

 -  Contact

## Overview
The three-tier architecture is a well-established software application architecture that organizes applications into three logical and physical computing tiers:

 -  Presentation Tier: Handles the user interface and user experience.

 -  Application Tier: Contains the business logic and application functionalities.

 -  Data Tier: Manages data storage and retrieval.

### In this project, Terraform scripts are used to provision the following AWS resources:

 -  Application Load Balancer (ALB): Distributes incoming traffic across multiple instances.

 -  Auto Scaling Group (ASG): Ensures the application scales in and out based on demand.

 -  Relational Database Service (RDS): Manages the database with high availability and security.

 -  Security Groups: Controls inbound and outbound traffic to AWS resources.

## Architecture Diagram

 Note: Replace link-to-your-architecture-diagram with the actual URL of your architecture diagram.

### Features
 -  Infrastructure as Code (IaC): Entire infrastructure is defined using Terraform.

 -  Scalability: Auto Scaling Group adjusts the number of instances based on load.

 -  High Availability: Multi-AZ RDS deployment ensures database availability.

 -  Security: Security Groups and IAM roles are configured following AWS best practices.

## Prerequisites
Before deploying this architecture, ensure you have the following:

 - Terraform: Installed on your local machine. Download Terraform

 - AWS CLI: Configured with appropriate credentials. Install AWS CLI

 - AWS Account: With permissions to create the necessary resources.

## Usage
### Clone the Repository:

git clone https://github.com/abdul-said/three-tier-architecture.git
cd three-tier-architecture

### Initialize Terraform:
  terraform init

### Plan the Deployment:
  terraform plan

### Apply the Deployment:
  terraform apply


## Access the Application:

Once the deployment is complete, retrieve the ALB DNS name from the Terraform output and access it via your browser.

### Destroy the Infrastructure (if needed):
  terraform destroy
>**Note:** This will remove all resources created by Terraform.

## Project Structure:

### alb.tf            
 - Defines the Application Load Balancer and its components
### asg.tf           
 - Configures the Auto Scaling Group and Launch Configuration
### main.tf          
 - Main Terraform configuration file
### rds.tf            
- Sets up the RDS instance
### sg.tf             
- Security Groups definitions
### user-data.sh      
- User data script for initializing EC2 instances
### variables.tf      
- Declares variables used in the Terraform scripts


## Security Considerations
IAM Roles and Policies: Ensure that the IAM roles and policies grant the minimum required permissions.

Security Groups: Review and restrict inbound and outbound rules to only necessary ports and IP ranges.

Secrets Management: Avoid hardcoding sensitive information. Use AWS Secrets Manager or Parameter Store for managing secrets.

State File Security: Protect the Terraform state file, especially when storing it remotely, as it may contain sensitive information.

## Contributing
Contributions are welcome! If you have suggestions or improvements, please fork the repository and submit a pull request.

## License
This project is licensed under the MIT License.

## Contact
For any questions or inquiries, please contact:

## Abdul Said
### Email: abdul-said@outlook.com
### LinkedIn: www.linkedin.com/in/abdulrahman-said-4557a3236
