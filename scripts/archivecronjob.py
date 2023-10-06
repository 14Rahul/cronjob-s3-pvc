import boto3

client = boto3.client('s3')

response = client.copy_object(
    Bucket='tests3copyscript',
    CopySource='/mounts3readwritetest/fil10',
    Key='fil10',
)

print(response)
