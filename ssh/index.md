### Copy from server to local


#### Connect to a server

```sh
ssh -i /path/to/private/key.pem ec2-user@your-aws-instance-ip
```

```sh
scp -i /path/to/private/key.pem ec2-user@your-aws-instance-ip:/path/to/source/file /path/to/destination
scp -i /path/to/your/key.pem /path/to/local/file.txt user@your_server_ip:/path/on/server/
```
