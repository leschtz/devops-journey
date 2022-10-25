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