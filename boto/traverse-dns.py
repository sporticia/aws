import boto3

client = boto3.client('route53')

def get_zones():
    paginator = client.get_paginator("list_hosted_zones")
    for page in paginator.paginate():
        yield from page["HostedZones"]

def get_records(zone_id):
    paginator = client.get_paginator("list_resource_record_sets")
    for page in paginator.paginate(HostedZoneId=zone_id):
        yield from page["ResourceRecordSets"]

zones = get_zones()

for zone in zones:
    records = get_records(zone["Id"])
    for record in records:
        print(f"{zone['Name']} - {record['Type']} - {record['Name']}")