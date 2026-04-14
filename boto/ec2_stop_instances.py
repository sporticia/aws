import boto3

def lambda_handler(event, context):
    # Create a session using the default configuration
    session = boto3.Session()

    # Get the list of all available regions for EC2
    ec2_regions = [region['RegionName'] for region in session.client('ec2').describe_regions()['Regions']]

    for region in ec2_regions:
        # Create an EC2 client for the current region
        ec2 = session.client('ec2', region_name=region)

        # Set up filters to find instances with the specified tag
        filters = [{'Name': 'tag:Name', 'Values': ['Instance Name']}]

        # Get details about instances that match the filter in the current region
        response = ec2.describe_instances(Filters=filters)

        # Initialize a list to hold the IDs of instances to be stopped
        instances_to_stop = []

        # Iterate over the reservations and instances
        for reservation in response["Reservations"]:
            for instance in reservation["Instances"]:
                # Check if the instance is running
                if instance["State"]["Name"] == "running":
                    instances_to_stop.append(instance["InstanceId"])

        # Stop the instances if the list is not empty
        if instances_to_stop:
            stop_response = ec2.stop_instances(InstanceIds=instances_to_stop)
            print(f'Stopping instances in {region}:', instances_to_stop)
        else:
            print(f"No running instances with 'Instance Name' tag found to stop in {region}")
