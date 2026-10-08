Reusable Terraform modules for AWS (VPC with public/private subnets, EC2), with separate DEV and PROD environments.

## Structure
- `modules/vpc`: VPC, subnets and related networking
- `modules/ec2`: EC2 instances
- `envs/DEV`, `envs/PROD`: environment-specific configuration
