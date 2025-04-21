```bsh
terraform init
terraform apply -var-file="myCustom.tfvars" --auto-approve
terraform destroy -var-file="myCustom.tfvars" --auto-approve
```