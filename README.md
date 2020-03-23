#Tasks Given
---

* Script: to set up a security group which allows access from one AWS VPC and from one external IP
  * created a simple network to demo how the security policy can be tested.  Please check *q1/question_1_security_group.tf*... Run with `terraform apply`  to test

* Python script to upload file to S3
  * leverages boto3 library to do a push to s3 bucket. There is room to make code a bit more robust. Tested with Python3 .. Run with `python shipamax-s3-loader.py`

* Terraform Script to add SES rule which saves the incoming email to S3 bucket “emails”.
  * This is a simple code. It assumes bucket already exists and the right access policy too. Script can be extended to create bucket and access policy.  Run with `terraform apply`  to test

