## Steps

1. Creation `main.tf`
2. `terraform init`
3. `terraform fmt`, `terraform validate`
4. `terraform plan`
5. `terraform apply`
   - If the instance is changed, first instance will be destroyed, then a new one will be created.
6. `terraform show`
7. `terraform destroy` 



## Terraform & AWS

Terraform needs the AWS IAM ACCESS and SECRET Key to be able to work with the platform.
```sh
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
```

Terraform can also use paths to resolve the `ACCESS_KEY_ID` and `SECRET_ACCESS_KEY`. More can be read in [Shared Configuration and Credential Files](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#shared-configuration-and-credentials-files)


## Questions

- Can different `provider` blocks be used in the same file?
  - Can different `regions` be used in the same file?
- When will `terraform apply` fail? How to prevent those failures?
- Are there some changes in `aws` which cannot be done with `terraform apply`? 
- How is `terraform destroy` handled with multiple resources?
- What is a `state` in terraform speech?
- Which Terraform files need to be commit?


## Lessons Learned
- `terraform validate` will fail, if the `provder` is not locally available. `terrform init` is needed to setup the environment.
- Changing `main.tf` and executing `terraform apply` will update the current state to the new one.
- `aws` will fail the `apply` step, when there is a space character in `ami = "this_is_the_ami "` like here at the end. 
- `terraform apply -auto-approve` to remove interactive step
- `terraform plan` is the dry-run version of `terraform apply`, variables can be set via both and the plan can be seen as is.

## Links

- [Terraform Best Practices by Hashicorp](https://developer.hashicorp.com/terraform/cloud-docs/recommended-practices)
- [Terraform Lock File](https://developer.hashicorp.com/terraform/language/files/dependency-lock)