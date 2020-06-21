# terraform-aws-rds
Custom Terraform module for AWS RDS 

## Pre requirements: 
You need to have VPC and set Tier tag for target subnet,  (looking for 'Private' by default)

## Configure Terraform Provider
```
export AWS_PROFILE="training-aws"
export AWS_DEFAULT_REGION="eu-central-1"
```
or change main.tf like this
```
provider "aws" {
  region  = "eu-central-1"
  profile = "training-aws"
}
```

## Configure Terraform variables
```
export AWS_PROFILE="training-aws"
export AWS_DEFAULT_REGION="eu-central-1"
export TF_VAR_name="aws-vpc-instance"
export TF_VAR_vpc_id="vpc-01000666f827c"
```
## Init
```
terraform init
```

## Plan
```
terraform plan
```

## Apply
```
terraform apply -auto-approve
```

## Destroy
```
terraform destroy -auto-approve
```
