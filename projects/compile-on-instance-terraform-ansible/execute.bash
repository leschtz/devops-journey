#!/bin/bash -x 


IDENTITY_FILE="~/dev/aws-setup/test-key.pem"

terraform init
terraform apply -auto-approve

PUBLIC_IP=$(terraform output -raw instance_public_ip)
echo "[buildserver]" > inventory 
echo "$PUBLIC_IP" >> inventory
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory -u ubuntu playbook.yaml

mkdir tmp
scp -i $IDENTITY_FILE -o StrictHostKeyChecking=no ubuntu@$PUBLIC_IP:/tmp/zsh/Src/zsh $PWD/tmp/


terraform destroy -auto-approve

# execute binary locally
docker run -v $PWD/tmp/:/mnt/local -it ubuntu /mnt/local/zsh --version

# cleanup
rm -rf ./tmp/
rm -f *.tmp
