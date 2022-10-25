#!/bin/bash -x 

IDENTITY_FILE="~/dev/aws-setup/test-key.pem"

terraform init
terraform apply -auto-approve

PUBLIC_IP=$(terraform output -raw instance_public_ip)
PUBLIC_DNS=$(terraform output -raw instance_public_dns)

scp -i $IDENTITY_FILE -o StrictHostKeyChecking=no execute-on-instance.bash ubuntu@$PUBLIC_DNS:/home/ubuntu
ssh -i $IDENTITY_FILE -o StrictHostKeyChecking=no ubuntu@$PUBLIC_DNS "chmod +x execute-on-instance.bash"

# execute script on remote
ssh -i $IDENTITY_FILE -o StrictHostKeyChecking=no -t ubuntu@$PUBLIC_DNS "./execute-on-instance.bash"


mkdir tmp
scp -i $IDENTITY_FILE -o StrictHostKeyChecking=no ubuntu@$PUBLIC_DNS:/home/ubuntu/zsh/Src/zsh $PWD/tmp/


terraform destroy -auto-approve

# execute binary locally
docker run -v $PWD/tmp/:/mnt/local -it ubuntu /mnt/local/zsh --version

# cleanup
rm -rf ./tmp/
rm -f *.tmp
