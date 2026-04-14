import boto3
from datetime import datetime

ec2 = boto3.client('ec2')
current_date = datetime.now().strftime("%Y-%m-%d")    
try:
    response = ec2.create_snapshot(
        VolumeId='YOUR-VOLUME-ID',
        Description='My EC2 Snapshot',
        TagSpecifications=[
            {
                'ResourceType': 'snapshot',
                'Tags': [
                    {
                        'Key': 'Name',
                        'Value': f"My EC2 snapshot {current_date}"
                        }
                    ]                    
            }
        ]              
    )    
except Exception as e:
    print(f"Error creating snapshot: {str(e)}")