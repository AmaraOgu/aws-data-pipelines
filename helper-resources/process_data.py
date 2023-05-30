import json
import boto3

def lambda_handler(event, context):
    # Extract the required fields from the API Gateway event
    if 'body' in event:
        event = json.loads(event['body'])
    else:
        event = json.loads(event['Records'][0]['body'])
        
    # Extract the required fields
    required_fields = ['id', 'title', 'price', 'category']
    processed_data = {field: event.get(field) for field in required_fields}
    
    # Convert the processed data to JSON
    processed_data_json = json.dumps(processed_data)
    
    # Encode the data as a byte string
    encoded_data = processed_data_json.encode('utf-8')
    
    # Create a Kinesis client
    kinesis_client = boto3.client('kinesis')
    
    # Send the processed data to the Kinesis stream
    response = kinesis_client.put_record(
        StreamName='demo-datastream', #replace with your Kinesis stream name
        Data=encoded_data,
        PartitionKey='partition_key'
    )
    
    return {
        'statusCode': 200,
        'body': 'Processed Data sent to Kinesis stream successfully.'
    }
