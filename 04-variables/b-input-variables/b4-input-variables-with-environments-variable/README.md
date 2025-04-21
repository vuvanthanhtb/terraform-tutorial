```bsh
export TF_VAR_my_instance_type=t2.small
export TF_VAR_instance_count=2
export TF_VAR_my_volume_size=20
```

```bsh
terraform init
terraform apply --auto-approve
```