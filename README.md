# aws-data-pipelines

This repository focuses on building a data pipeline in AWS using Terraform.  
The blog for this workflow is published on [Medium](https://medium.com/@amarachi.ogu/building-a-real-time-streaming-data-pipeline-in-aws-using-terraform-87292be45455)    


## Architecture Diagram  
![Workflow Architecture Diagram](https://miro.medium.com/v2/resize:fit:4800/format:webp/1*Tgnf0390Vw_owgSHBBGU5g.png) 

## Architecture Overview  
The architecture diagram illustrates a streaming pipeline tailored for an ecommerce website, enabling the efficient processing and storage of data in real-time.
Please note that this is a simplified overview of the architecture, additional components or configurations may be required based on specific use cases and requirements.  

1. Ecommerce Website: The pipeline starts with an ecommerce website, serving as the primary data source. User interactions, such as product views, add-to-cart events, or purchases, generate data that needs to be processed and analyzed. For the purpose of this blog, we will use cURL to send some sample data provided by the Fake Store API.
2. AWS API Gateway: The ecommerce website interacts with the AWS API Gateway, which acts as the central API management service. It securely handles incoming requests from the website, manages authentication, and controls traffic flow.
3. Lambda: The AWS API Gateway triggers a Lambda function, a serverless compute service. The Lambda function processes the incoming ecommerce data, performing necessary transformations or executing specific business logic to extract relevant data.
Kinesis: Processed ecommerce data from Lambda is directed to Kinesis, an AWS real-time data streaming service. Kinesis facilitates the seamless collection, processing, and analysis of large-scale data streams in real-time.
4. Kinesis Firehose: Kinesis Firehose is utilized as a delivery stream, receiving data from Kinesis. It is a managed service, efficiently loading streaming data into various destinations for further processing or storage.
5. S3 Bucket: Kinesis Firehose delivers the ecommerce data to an S3 bucket, an Amazon Simple Storage Service. The S3 bucket provides scalable and durable object storage in the cloud, securely housing the streaming data for future analysis, processing, and long-term storage. Depending on your use case, the data may be loaded into Redshift or other supported services.
6. Terraform: Terraform plays a vital role in this architecture as the Infrastructure as Code (IaC) tool. It enables the provision and management of all the necessary AWS resources, including API Gateway, Lambda functions, Kinesis, Kinesis Firehose, and S3 bucket, in a consistent and reproducible manner.  

## Getting Started
We will use Terraform to provision the following:
1. Private S3 bucket, configured to allow Kinesis to write to it.
2. Kinesis Data Stream
3. Kinesis Firehose, configured to allow it to write to s3 bucket.
4. Lambda function, configured to allow it to send data to Kinesis.
5. API gateway service, configured to invoke Lambda Function.

### Project Structure

```
.
├── README.md 
├── helper-resources 
│   ├── process_data.py                 - contains Python code to be run by Lambda
│   ├── process_data.zip                - contains process_data.py in a zip archive
│   └── send_to_s3.py                   - contains sample code to send data to s3
├── modules
│   ├── api-gateway
│   │   ├── gateway.tf                  - API Gateway configuration
│   │   ├── output.tf                   - output of the configurations
│   │   ├── permission.tf               - permissions needed by the API Gateway
│   │   └── variables.tf                - variables used by the API Gateway configuration
│   ├── kinesis
│   │   ├── README.MD                   - guide on how to use the Kinesis module
│   │   ├── kinesis_firehose.tf         - Kinesis Firehose configurations
│   │   ├── kinesis_iam.tf              - Kinesis Firehose IAM requirements
│   │   ├── kinesis_stream.tf           - Kinesis Stream configurations
│   │   ├── output.tf                   - output of the configurations
│   │   └── variables.tf                - variables used by the Kinesis configuration
│   ├── lambda
│   │   ├── README.MD                   - guide on how to use the Lambda module
│   │   ├── lambda_function.tf          - Lambda function configuration
│   │   ├── lambda_iam.tf               - Lambda function IAM requirements
│   │   ├── output.tf                   - output of the configurations
│   │   ├── permissions.tf              - permissions needed by the Lambda function
│   │   └── variables.tf                - variables used by the Lambda configuration
│   └── s3
│       ├── README.MD                   - guide on how to use the S3 module
│       ├── bucket_iam.tf               - IAM configuration for the S3 bucket
│       ├── output.tf                   - output of the configurations
│       ├── s3_bucket.tf                - S3 bucket configuration
│       └── variables.tf                - variables used by the S3 configuration
└── setups
    ├── main.tf                         - configuration to build the resources
    ├── provider.tf                     - providers definition
    ├── terraform.tfvars                - values used in building the resources
    └── variables.tf                    - variables used by the configuration

```

The setups/main.tf file contains the Terraform configuration code for provisioning the necessary AWS resources. Ensure that you set the appropriate values for the variables defined in setups/terraform.tfvars to match your specific environment and requirements.

For more detailed information on each module and how to use them, refer to the respective README.md files in the modules directory.

### Pre-requisites
To use this Terraform configuration, you need the following:

1. An AWS account
2. Terraform installed on your local machine
3. AWS credentials set up on your local machine

### Configurations 
To modify this configuration, navigate to the specific module and consult the README for guidance.
This deployment region has been set to `us-east-1` to deploy to a different region navigate to setups/provider.tf and change the region.

## Usage
To use this Terraform project, follow these steps:

1. Clone the repository to your local machine.
```
git clone https://github.com/AmaraOgu/aws-data-pipelines.git
```
2. Change into the setups directory. 
```
cd setups
```
3. Update the values in setups/terraform.tfvars to match your desired configuration.

4. Initialize the working directory:
```
terraform init
```
5. Plan the build:
```
terraform plan 
```
6. Apply the changes:
```
terraform apply 
```
or   
```
terraform apply --auto-approve
```
7. When you are finished, destroy the infrastructure:
```
terraform destroy 
```
or 
```
terraform destroy --auto-approve
```

The blog for this workflow is published on [Medium](https://medium.com/@amarachi.ogu/building-a-real-time-streaming-data-pipeline-in-aws-using-terraform-87292be45455)    