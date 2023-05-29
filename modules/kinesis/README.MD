# Configuring Kinesis
This Terraform configuration sets up a Kinesis data stream and a Kinesis Data Firehose delivery service. The Kinesis delivery service writes the data to an S3 bucket configured to recieve the data.

## Kinesis Stream
The kinesis_data_stream resource sets up an Amazon Kinesis data stream that receives data from the processed by the Lambda function. The configuration specifies the name of the stream, the number of shards, and the retention period for data stored in the stream.

## Kinesis Firehose Delivery Stream
The kinesis_firehose resource sets up an Amazon Kinesis Firehose to receive data from the Kinesis stream and deliver it to the S3 bucket. The configuration specifies the name of the delivery stream and the destination as S3.

The kinesis_source_configuration block (in kinesis_firehouse.tf file) specifies the ARN of the S3 bucket where the data will be stored. 

## Pre-requisites
To use this Terraform configuration, you need the following:

1. An AWS account
2. Terraform installed on your local machine
3. AWS credentials set up on your local machine

## Input Variables
This Terraform configuration uses the following variables:
| Name                   | Description                                    | Type   | Default |
|------------------------|------------------------------------------------|--------|---------|
| kinesis_stream_name    | Name of the Kinesis Data Stream                | string |         |
| kinesis_firehose_name  | Name of the Kinesis Firehose                   | string |         |
| firehose_destination   | Destination for data storage                   | string |         |
| bucket_arn             | The ARN of the s3 bucket to store the data     | string |         |

## Output
This lamba configuration provides the following output:
| Name                    | Description                                    | Type   | Default |
|-------------------------|------------------------------------------------|--------|---------|
| kinesis_data_stream_arn | The ARN of the created kinesis data stream     | string |         |

1. Clone the repository to your local machine.
```
git clone https://github.com/AmaraOgu/aws-data-pipelines.git
```
2. Navigate to the setups directory.
```
cd setups
```
3. Open the terraform.tfvars file and configure the required variables as desired.

## Input Variables
This s3 configuration uses the following variables:
| Name                   | Description                                    | Type   | Default |
|------------------------|------------------------------------------------|--------|---------|
| kinesis_stream_name    | The name of the Kinesis stream                 | string |         |
| kinesis_firehose_name  | The name of the Kinesis Firehose               | string |         |
| bucket_arn             | The ARN of the S3 bucket                       | string |         |

## Output
This s3 configuration provides the following output:
| Name                    | Description                                    | Type   | Default |
|-------------------------|------------------------------------------------|--------|---------|
| kinesis_data_stream_arn | The ARN of the Kinesis stream                  | string |         |



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
```
terraform plan -target=module.kinesis
``` 

4. Apply the changes: use '-target' to specify the module you want to create 
```
terraform apply -target=module.kinesis
``` 
5. When you are finished, destroy the infrastructure:
```
terraform destroy 
```
or 
```
terraform destroy --auto-approve
``` 

## Additional configurations 
To modify the configuration of this Kinesis, you can make changes to the `.tf` file in the kinesis directory.

