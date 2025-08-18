## Aws configue

```
aws configue
```

---

## 🔹 Step 1: List All Instances

```bash
aws ec2 describe-instances
```

This will return a **JSON** output with details (instance IDs, state, type, public IP, etc.).
If that’s too much info, add a filter:

```bash
aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId,State.Name,InstanceType,PublicIpAddress]" --output table
```

👉 Example output:

```
---------------------------------------------
|        DescribeInstances                  |
+-----------------+----------+-----------+---------+
|  i-0abcd1234efg | running  | t2.micro  | 54.23.1.45 |
+-----------------+----------+-----------+---------+
```

---

## 🔹 Step 2: Check a Specific Instance

If you know your **Instance ID** (`i-xxxxxxxxxxxx`):

```bash
aws ec2 describe-instances --instance-ids i-1234567890abcdef
```

---

## 🔹 Step 3: Check Instance Status (Health Checks)

```bash
aws ec2 describe-instance-status --instance-ids i-1234567890abcdef --output table
```

This shows:

- `SystemStatus` → AWS infrastructure health
- `InstanceStatus` → Your VM’s OS health
- `Events` → Scheduled reboots/maintenance

---

## 🔹 Step 4: Get Just the Public IP

```bash
aws ec2 describe-instances \
  --instance-ids i-1234567890abcdef \
  --query "Reservations[0].Instances[0].PublicIpAddress" \
  --output text
```

---

## 🔹 Step 5: (Optional) SSH into the Instance

Once you have the **public IP**, connect:

```bash
ssh -i my-key.pem ec2-user@<Public-IP>
```

(replace `ec2-user` with `ubuntu` if it’s an Ubuntu AMI).

---

👉 Quick Tip: Run this to see **all running instances** only:

```bash
aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --output table
```

---

Do you want me to show you how to make a **simple alias/script** so you can run just `aws-ec2-status` and instantly see your instance state + IP, instead of typing the long CLI command each time?
