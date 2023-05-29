## Configuring the Lambda with Terraform

This Terraform configuration automates the setup of an AWS Lambda function triggered by an API Gateway. The Lambda function processes data and sends it to a Kinesis data stream  

## Pre-requisites
To use this Terraform configuration, you need the following:

1. An AWS account
2. Terraform installed on your local machine
3. AWS credentials set up on your local machine
4. An S3 bucket (not managed by Terraform) to upload the data-processing ZIP file that will be executed by the Lambda function

## Usage
To use this Terraform configuration, follow these steps:

1. Clone the repository to your local machine.
```
git clone https://github.com/AmaraOgu/aws-data-pipelines.git
```
2. Upload the code that will be executed by the Lambda function to the pre-existing S3 bucket (not managed by Terraform). In this case, the code is a Python script in the `process_data.zip` file. The Python script processes the event payload by extracting specific fields and sends the processed data as a record to a Kinesis stream using Boto3. It returns a response indicating the success of the data transmission.

Ensure that the value assigned to the `StreamName` variable in the Python code corresponds to the name of the Kinesis stream you intend to configure.

```
cd helper-resources
aws s3 cp process_data.zip s3://your-s3-bucket-name
```  
2. Navigate to the setups directory.
```
cd setups
```
3. Open the terraform.tfvars file and configure the required variables as desired.

Note: In the /setups/main.tf file, this Lambda function is configured to depend on the S3 bucket. If you are using this configuration, ensure that the S3 bucket is built first. Otherwise, in the setups/main.tf file, uncomment the depends_on line.

## Input Variables
This Terraform configuration uses the following variables:
| Name                   | Description                                    | Type   | Default |
|------------------------|------------------------------------------------|--------|---------|
| function_name          | Name of the Lambda function                    | string |         |
| handler                | Name of the function to be executed            | string |         |
| runtime                | Runtime of the Lambda function                 | string |         |
| timeout                | Timeout of the Lambda function                 | number | 60      |
| memory_size            | Memory size of the Lambda function             | number | 128     |
| source_bucket          | Name of the S3 bucket for function code        | string |         |
| s3_pyhon_script_key    | Name of the Python script in the S3 bucket     | string |         |
| account_id             | AWS account ID for the current account         | string |         |
| kinesis_data_stream_arn| ARN of the Kinesis data stream                 | string |         |


## Output
This Lambda configuration provides the following output:
| Name                   | Description                                    | Type   | Default |
|------------------------|------------------------------------------------|--------|---------|
| lambda_function_arn    | The ARN of the created Lambda function         | string |         |


## Usage
1. Change into the directory:
```
cd setups
```
2. Initialize the working directory:  
```
terraform init
```  
3. Plan the changes: use '-target' to specify the module you want to create 
-target=module.lambda_function 
```
terraform plan -target=module.lambda_function 
```

3. Apply the changes: use '-target' to specify the module you want to create 
-target=module.lambda_function 
```
terraform apply -target=module.lambda_function 
```

4. When you are finished, destroy the infrastructure:
```
terraform destroy 
```
or 
```
terraform destroy --auto-approve
```

## Additional configurations 
To modify the configuration of this Lambda function, you can modify the `.tf` files in the lambda directory.