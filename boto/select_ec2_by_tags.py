import boto3
ec2 = boto3.resource('ec2')

def lambda_handler(event, context):
    filters = [{
        'Name': 'tag:Project',
        'Values': [
            'I_Dollar_Tree'
        ]
    }]

    instances = ec2.instances.filter(Filters=filters)

    running_instances = [instance.id for instance in instances]

    if len(running_instances) > 0:
        print("found instances with tag")
    else:
        print("none found")
