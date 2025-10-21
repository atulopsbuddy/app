Infrastructure Deployment Guide
1. Create VPC

Use the following CloudFormation template to create the VPC.
It will provision:

2 Public Subnets

2 Application (Private) Subnets

2 Database Subnets

Template: CFT/vpc-cft

2. Create ECS Cluster and ECR Repository

Deploy the ECS Cluster and ECR repository using the below CloudFormation template:
Template: CFT/ecs-ecr-cft

3. Create PostgreSQL RDS Instances

Non-Prod RDS:
CFT/non-prod-postgres-rds-cft

Prod RDS:
CFT/prod-postgres-rds-cft

4. Create Shared Parameter Store

Deploy shared AWS Systems Manager Parameter Store entries used across environments.
Template: CFT/shared-params

5. Create CodePipeline for ECS Task Automation

This CloudFormation template sets up the CodePipeline to automate ECS task builds and deployments.
Template: CFT/codepipeline

6. Pre-Requisites Before Running the CodePipeline CFT

Before executing the CodePipeline CloudFormation stack, ensure the following:

Update buildspec.yml and taskdef.json files in your GitHub repository with correct parameter values.
Example:
ECR_REPO_NAME: "/procur/test/shared/ECR_REPO_NAME"
(This parameter should exist in the Parameter Store created via shared-params CFT.)

Verify the following:

ECS Task Definition → Correct family name is set.

S3 File / Environment File ARN → Matches the appropriate environment.
