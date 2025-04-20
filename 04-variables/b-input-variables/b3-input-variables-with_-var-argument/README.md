```bash
terraform apply -var "my_instance_type=t2.small" -var "instance_count=2" -var "my_volume_size=20" --auto-approve
```

### use file .out
```bash
terraform plan -var "my_instance_type=t2.small" -var "instance_count=2" -var "my_volume_size=20" -out <name>.out
terraform apply <name>.out
```
