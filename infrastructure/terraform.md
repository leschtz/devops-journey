# Terraform

- For many resources, us the `count` element. Be aware, that any `output` resource then has to be used in a `list` approach: `aws_instance.$INSTANCE_NAME.public_ip` becomes `aws_instance.$INSTANCE_NAME.*.public_ip`.
- `vpc_security_group_ids` uses ids, `security_groups` uses names
- AWS needs a valid key to be named, to be able to connect to the instance. Can be done with `key_name`
- `scp: ambigous target` is written to the command line. 
  - This was a result as `-t` was used, this does not exist for `scp`
- The default `security_group` of AWS is not allowing traffic from the outside. Use the correct security group for this.


## Conclusion

Terraform makes it much more easier, to create AWS instances. By maintaining the `main.tf` file, it was much easier to debug the setup, than working with `aws ec2` command-line tool. Fetching the `public_ip` and `public_dns` is easier with Terraform, in general it reduces the overhead for me as a user. Comparing the scripts [AWS CLI Compile Script](../../../cloud-providers/aws/compile-on-instance/execute.bash) and [Terraform Compile Script](execute.bash), the difference is clear, how much Terraform can reduce the script size and effectively reduce error-proneness.

Nevertheless, this script is not fully optimal yet, as it is not integrated within a pipeline yet. 