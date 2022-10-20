#!/bin/bash -x

KEY_PAIR="testKeyPair"
SECURITY_GROUP="sg-09d7885d3ebca300f" # test group
AMI_ID="ami-0d0dd86aa7fe3c8a9" # ubuntu 22.04 x86_64
INSTANCE_TYPE="t2.micro" # AWS Free Tier
NR_INSTANCES=1
IDENTITY_FILE="../../../../aws-setup/test-key.pem"

# ensure a valid keypair exists
aws ec2 describe-key-pairs --key-names $KEY_PAIR > keypair.tmp 
if [ $? -ne 0 ]; then
    echo "Could not find $KEY_PAIR"
    exit 1
fi

# ensure a valid vpc with security group exists
aws ec2 describe-security-groups --group-id $SECURITY_GROUP > groups.tmp
if [ $? -ne 0 ]; then
    echo "Could not find $SECURITY_GROUP"
    exit 2
fi


# create the ec2 instance
aws ec2 run-instances --image-id $AMI_ID --count $NR_INSTANCES --instance-type $INSTANCE_TYPE --key-name $KEY_PAIR --security-group-ids $SECURITY_GROUP > instance.tmp
if [ $? -ne 0 ]; then
    echo "Could not find $SECURITY_GROUP"
    exit 2
fi

# connect to the instance
INSTANCE_ID=$(jq -r ".Instances | .[0] | .InstanceId" "instance.tmp")

#aws ec2 wait instance-running --instance-ids $INSTANCE_ID
aws ec2 wait instance-status-ok --instance-ids $INSTANCE_ID

aws ec2 describe-instances --filters "Name=instance-id,Values=$INSTANCE_ID" > instance-running.tmp
CONNECTION=$(jq -r ".Reservations | .[0] | .Instances | .[0] | .PublicDnsName" "instance-running.tmp")

# aws ec2 describe-instances --filters "Name=instance-state-name,Values=pending,running" # to show all running nodes
#sleep 5
# move script to instance
# how to acknowledge the authentication?
scp -i $IDENTITY_FILE -o StrictHostKeyChecking=no execute-on-instance.bash ubuntu@$CONNECTION:/home/ubuntu

# make script executable on remote
ssh -i $IDENTITY_FILE -o StrictHostKeyChecking=no ubuntu@$CONNECTION "chmod +x execute-on-instance.bash"


# execute script on remote
ssh -i $IDENTITY_FILE -o StrictHostKeyChecking=no -t ubuntu@$CONNECTION "./execute-on-instance.bash"

#ssh -i $IDENTITY_FILE -o StrictHostKeyChecking=no ubuntu@$CONNECTION "sudo apt update"
#ssh -i $IDENTITY_FILE -o StrictHostKeyChecking=no ubuntu@$CONNECTION "sudo apt install -y git gcc autoconf make"
#ssh -i $IDENTITY_FILE -o StrictHostKeyChecking=no ubuntu@$CONNECTION "sudo apt install -y libncurses-dev"
#ssh -i $IDENTITY_FILE -o StrictHostKeyChecking=no ubuntu@$CONNECTION -t "git clone git://git.code.sf.net/p/zsh/code zsh && cd zsh && ./Util/preconfig && ./configure --disable-dynamic && make && make check"

# download binary 
mkdir tmp
scp -i $IDENTITY_FILE -o StrictHostKeyChecking=no ubuntu@$CONNECTION:/home/ubuntu/zsh/Src/zsh $PWD/tmp/

# destroy instance
aws ec2 terminate-instances --instance-ids $INSTANCE_ID

# execute binary locally
docker run -v $PWD/tmp/:/mnt/local -it ubuntu /mnt/local/zsh --version

# cleanup
rm -rf ./tmp/
rm -f *.tmp
