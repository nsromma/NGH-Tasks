
# Explanation of choice of various services used in this task

This assignment involves deploying a containerized nginx image to a production environment of my choice. I decided to choose AWS as my cloud provider. AWS has different services/products that helps in deploying of applications easily, safely and quickly. The second reason for choosing AWS is that I have a substantial knowledge of most of their services and I am more confident using their services.
## AWS Services: Pros and Cons
For a containerized application, some of the services available to me in AWS include, Elastic Container Service (ECS), Elastic Kubernetes Service (EKS), Amazon Lambda, AWS LightSail, AWS AppRunner, EC2, AWS Fargate, etc. Of all these services, I decided to choose EC2 with an installed docker container to deploy my nginx containerized image. Comparatively, EC2 is much slower in deploying applications since it requires configuring each of it's underlying services and dependencies in order to function properly. These configurations and its subsequent maintenance has the tendency to slow the deployment process. Configuring, maintaining and patching of these underlying services may also be costly. For a managed service like AWS Lambda, AWS LightSail, etc, the patching and maintenance of the underlying services are managed by the service provider. Security has also been an issue associated with EC2. Despite these setbacks, EC2 provides a highly flexible infrastructure for deploying one's application. With EC2, one can customized the underlying resources needed to manage and provision their infrastructure. You can customized, for e.g, the memory, os, vCPU, etc. of your EC2 depending on the type of application you are deploying. 

## Applicability of the solution to real world production

In the health sector, where data management and security, data privacy is on high alert, the EC2 instances can be configured to provide high security to protect the infrastructure from being compromised. The following are some of the actions that can secure the EC2 infrastrucre;

 - The use of secret credentials to acces to make requests on the EC2 instance e.g access keys and secret access keys.
 - Creating security groups to restrict access to the instances.
 - The use of private subnets for your instances.
 - Using e.g NAT, bastion hosts to access internet from your private subnet.
 - Using different subnets for different applications e.g data, web, etc.
 - Accessing the entire infrastructure through a VPN 
 - Using different instances for different tasks.
 
 ## For data protection
 - Enforce global use of multi-factor authentication (MFA).
 - Use SSL/TLS when communicating with other AWS services.
 - Using API and user activity logging with AWS CloudTrail will also help in monitoring your infrastructure.
 - Customer details e.g email addresse, names, etc should not be used as tags, etc.
 
 ## IP Addresses
 In this public repo, the ip addresses stated in the task have been changed in the variable.tf file due to security issues.
