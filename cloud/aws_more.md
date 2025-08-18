Perfect 👍 you’re at the fun stage now — once the AWS CLI is set up, you can explore almost **every AWS service** from the terminal. Let me give you a **practical “command menu”** of things you can do, grouped by common services.

---

# 🔹 Core AWS CLI Commands You Should Know

## 🖥️ EC2 (Servers)

- **List instances**

  ```bash
  aws ec2 describe-instances --output table
  ```

- **Start an instance**

  ```bash
  aws ec2 start-instances --instance-ids i-1234567890abcdef
  ```

- **Stop an instance**

  ```bash
  aws ec2 stop-instances --instance-ids i-1234567890abcdef
  ```

- **Reboot an instance**

  ```bash
  aws ec2 reboot-instances --instance-ids i-1234567890abcdef
  ```

- **Check system health**

  ```bash
  aws ec2 describe-instance-status --instance-ids i-1234567890abcdef --output table
  ```

---

## 📦 S3 (Storage)

- **List all buckets**

  ```bash
  aws s3 ls
  ```

- **Create a bucket**

  ```bash
  aws s3 mb s3://my-unique-bucket-name
  ```

- **Upload a file**

  ```bash
  aws s3 cp file.txt s3://my-unique-bucket-name/
  ```

- **Download a file**

  ```bash
  aws s3 cp s3://my-unique-bucket-name/file.txt .
  ```

- **Sync a local folder to S3**

  ```bash
  aws s3 sync ./localfolder s3://my-unique-bucket-name/
  ```

---

## 🔐 IAM (Users & Permissions)

- **List users**

  ```bash
  aws iam list-users
  ```

- **List policies attached to a user**

  ```bash
  aws iam list-attached-user-policies --user-name myuser
  ```

- **Create a new user**

  ```bash
  aws iam create-user --user-name devuser
  ```

---

## 📊 CloudWatch (Logs & Metrics)

- **List log groups**

  ```bash
  aws logs describe-log-groups
  ```

- **Tail a log stream (like `tail -f`)**

  ```bash
  aws logs tail /aws/lambda/my-function --follow
  ```

- **List alarms**

  ```bash
  aws cloudwatch describe-alarms
  ```

---

## ⚡ Lambda (Serverless Functions)

- **List Lambda functions**

  ```bash
  aws lambda list-functions
  ```

- **Invoke a Lambda function**

  ```bash
  aws lambda invoke --function-name my-function response.json
  ```

---

## 🗄️ DynamoDB (NoSQL Database)

- **List tables**

  ```bash
  aws dynamodb list-tables
  ```

- **Scan a table**

  ```bash
  aws dynamodb scan --table-name MyTable
  ```

---

## 🚀 Extra Useful Commands

- **See who you are logged in as**

  ```bash
  aws sts get-caller-identity
  ```

- **Check AWS CLI version**

  ```bash
  aws --version
  ```

- **Get help for any service**

  ```bash
  aws ec2 help
  aws s3 help
  ```

---

# 🔹 How to Explore More

AWS CLI has **200+ services**. To explore:

```bash
aws help              # lists all services
aws ec2 help          # help for EC2 commands
aws s3 help           # help for S3 commands
```

---

✅ Suggestion: Start with **EC2 + S3 + IAM**. Once you’re comfortable, branch into **CloudWatch** (for monitoring) and **Lambda** (for serverless).

---

Do you want me to create a **hands-on practice project list** (like: “Day 1: create an S3 bucket and upload files”, “Day 2: launch an EC2 instance”, etc.), so you’ll learn CLI step by step while actually building?
