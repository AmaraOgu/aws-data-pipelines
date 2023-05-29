import json 
import boto3 
import time
from datetime import datetime

s3= boto3.client('s3')
def lambda_handler(event, context):
  bucket = 'datastreamdemo'
  streamdata = bytes(json.dumps(event). encode("UTF-8"))
  filename= str(time.time() * 1000)+".json" 
  s3.put_object(Bucket=bucket, Key=filename, Body=streamdata)
  return {
    'statusCode': 200,
    'body': json.dumps("S3 file created")
  }
