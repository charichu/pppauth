#Authentication Service using mongo for user data

Example outputs are all happy path

Mail for verification is send by mailtrap currently

#Env variables
PORT=8000
MONGO_INITDB_ROOT_USERNAME
MONGO_INITDB_ROOT_PASSWORD
MONGODB_LOCAL_URI
MONGODB_URI
ACCESS_TOKEN_PRIVATE_KEY
ACCESS_TOKEN_PUBLIC_KEY
ACCESS_TOKEN_EXPIRED_IN=15m
ACCESS_TOKEN_MAXAGE=15
REFRESH_TOKEN_PRIVATE_KEY
REFRESH_TOKEN_PUBLIC_KEY
REFRESH_TOKEN_EXPIRED_IN=60m
REFRESH_TOKEN_MAXAGE=60

EMAIL_FROM=admin@admin.com
SMTP_HOST=sandbox.smtp.mailtrap.io
SMTP_USER
SMTP_PASS
SMTP_PORT=587

#Routes 
/api/auth/register
Input:
{
	"email": "johndoe4@gmail.com",
	"name": "John Doe",
	"password": "password123",
	"passwordconfirm": "password123"
}

Output:
{
	"message": "We sent an email with a verification code to johndoe4@gmail.com",
	"status": "success"
}


/api/auth/login
Input:
{
	"email": "johndoe4@gmail.com",
	"password": "password123"
}
Output:
{
	"access_token": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NzkzNTAzNTMsImlhdCI6MTY3OTM0OTQ1MywibmJmIjoxNjc5MzQ5NDUzLCJzdWIiOiI2NDE0ZjdjMTZkZTgyZjk0NDNjNGY5YWMifQ.DG0gVjwZey7INUiof-yMIukzDxSrf7VGcPgVR-jgJ0o9_gv5l20CPotDNM11igTr_euo3BaTglexobGTv1nup0-Vhsr4Kmg-v8Gaj89eYJQa2Nc3LGZBlwuPfL7OOwywBwXgBqy4-B6pINzcBGXkrGVabe_ZUAVRMZVOFLhRZ4M",
	"status": "success"
}

/api/auth/logout
Output:
{
	"status": "success"
}

/api/auth/refresh
Output:
{
	"access_token": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NzkwOTY2ODQsImlhdCI6MTY3OTA5NTc4NCwibmJmIjoxNjc5MDk1Nzg0LCJzdWIiOiI2NDE0ZjdjMTZkZTgyZjk0NDNjNGY5YWMifQ.CoQah_UeYPO018G6kX2dTyt3rCt8iBusDMfWYptVMlNNu55V2tLj5z0jdvS7MviRIkos1rx4ZKmbCSJ2b_hGB17MDsLEUw09CzzAspY6XMJ82yfIAX6QE4oE_C8RM4ZOZj1CdQuSDIuXKwVxVHL03573QdoTYd9klmGki30hAP8",
	"status": "success"
}

/api/auth/verifyemail/:TOKEN
output:
{
	"message": "Email verified successfully",
	"status": "success"
}

/api/auth/forgotpassword
Input:
{
	"email": "johndoe4@gmail.com"
}
Output:
{
	"message": "You will receive a reset email if user with that email exist",
	"status": "success"
}

/api/auth/resetpassword/:TOKEN
Input:
{
	"password": "password123",
	"passwordconfirm": "password123"
}
Output:
{
	"message": "Password data updated successfully",
	"status": "success"
}

/api/users/me
Output:{
	"data": {
		"user": {
			"id": "6414f7c16de82f9443c4f9ac",
			"name": "John Doe",
			"email": "johndoe4@gmail.com",
			"role": "user",
			"created_at": "2023-03-17T23:29:05.499Z",
			"updated_at": "2023-03-17T23:29:05.499Z"
		}
	},
	"status": "success"
}