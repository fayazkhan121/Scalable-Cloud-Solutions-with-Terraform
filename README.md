# Scalable-Cloud-Solutions-with-Terraform

# How to Use
# Initialize Terraform

terraform init

If you stored your backend config in a separate file, run:

terraform init \
  -backend-config="backend-config/s3_backend.conf"

_________________

# Check the Execution Plan

terraform plan

Inspect the plan to ensure resources will be created as expected.

# Apply the Configuration

terraform apply

Type yes when prompted to confirm resource creation.


# Verify Resources

Check your AWS console for the new VPC, subnets, EC2 instance, and RDS instance.
Note the ec2_public_ip output, and browse to http://<public_ip> to see your test web page.

# Destroy the Infrastructure (When Testing is Complete)

terraform destroy

# Security Best Practices
Use the Principle of Least Privilege for your AWS access keys.
Restrict SSH Access (var.allowed_ssh_cidr) to your specific IP or corporate CIDR, never 0.0.0.0/0 in production.
Enable Encryption on your S3 backend bucket and on RDS at rest (set storage_encrypted = true in aws_db_instance).
Consider enabling Multi-AZ on your RDS instance for HA/DR.
Make sure your user_data does not contain secrets.
