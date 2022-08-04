import json
import boto3
def lambda_handler(event, context):
    
    ses = boto3.client('ses')
    body = """
    		state file is changed
    		
    		"""

    ses.send_email(
	    Source = 'ezzat.kadry.abonazel@gmail.com',
	    Destination = {
		    'ToAddresses': [
			    'ezzat.kadry.abonazel@gmail.com'
		    ]
	    },
	    Message = {
		    'Subject': {
			    'Data': 'Statefile changed',
			    'Charset': 'UTF-8'
		    },
		    'Body': {
			    'Text':{
				    'Data': body,
				    'Charset': 'UTF-8'
			    }
		    }
	    }
    )
    
    return {
        'statusCode': 200,
        'body': json.dumps('Successfully sent email from Lambda using Amazon SES')
    }