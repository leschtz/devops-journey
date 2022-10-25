# AWS


## Better Safe Than Sorry
How can I see all the instances I am running? 
- https://stackoverflow.com/questions/63895173/how-to-view-all-the-services-running-on-aws

## Identity and Access Management IAM 
- https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html#id_users_create_console
- https://docs.aws.amazon.com/IAM/latest/UserGuide/id.html?icmpid=docs_iam_console
- https://docs.aws.amazon.com/general/latest/gr/root-vs-iam.html#aws_tasks-that-require-root


## AWS CLI Setup and Configuration
- https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html
- https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html


## Setup an EC2 Instance via AWS CLI
### Steps
1. Create a Key Pair to use with the Instance
   - https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-keypairs.html
   - `aws ec2 describe-key-pairs`
2. Create a security group. This works as a firewall and handles network traffic
   - https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-sg.html
   - `aws ec2 describe-security-groups`
3. Configure the Security Group, to match the IP you are allowed to use. 
   - `aws ec2 authorize-security-group-ingress […]`
4. Find the AMI of your Distribution to run
   - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html
5. Launch an instance
   - https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-instances.html
   - `aws ec2 run-instances —image-id $AMI —count $NR_OF_VMS —instance-type t2.micro —key-name $MY_KEY —security-group-ids $SECURITY_GROUP_ID —subnet-id $SUBNET_ID`
   - `aws ec2 run-instances —image-id ami-0d0dd86aa7fe3c8a9 —count 1 —instance-type t2.micro —key-name testKeyPair —security-group-ids sg-09d7885d3ebca300f`
6. General Information about using the instance
   - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connection-prereqs.html#connection-prereqs-get-info-about-instancehttps://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connection-prereqs.html#connection-prereqs-private-key
7. terminate the instance, to stop billing
   - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/terminating-instances.html
   - https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-instances.html#terminating-instances


## Lessons Learned

- `aws ec2 wait instance-running --instance-ids $INSTANCE_ID` 
This command is very helpful, to wait until I can use the instance, to run the tools I have to run.

- `aws ec2 describe-instances --filters "Name=$filter-name,Values=$value1,$value2"`
This command helped me to detect all instances, where the state `instance-state-name` was either `pending` or `running`.

- `--query` allows to fetch certain information directly, like the `InstanceId`
`--query "Instances[*].InstanceId"`

- `aws ec2 wait instance-status-ok` is different to `aws ec2 wait instance-running`. An issue I had with latter, I couldn't immediately connect to the instance via `ssh`. According to the EC2 Dashboard help, `instance-status-ok` checks for the instance to be reachable by the network, while `instance-running` checks purely for the state. This takes more time, however it seems to be reliable.

- A problem occured `configure no controlling tty`
This was solved via [Open pseudo TTY via ssh](https://android.stackexchange.com/questions/69965/ssh-no-controlling-tty-open-dev-tty-no-such-device-or-address)
`-t` creates a pseudo `tty`, which is needed for many tasks, however `ssh` does not provide this by default.

- There exist `system` and `instance` checks, which are automatically executed every minute on the machine. 
  - `system` checks are used directly on the hardware running. This concerns general power, network connectivity, storage issues.
  - `instance` checks are relevant for the instance.

## FAQ
#### What is the difference between a `stopped` and a `terminated` instance?
Neither cost money. As soon as the instance is stopped, they are not running anymore and therefor do not incur money.
The difference is, a `stopped` instances can be run again, while the `terminated` instance is thrown away and can’t be used anymore.

#### 