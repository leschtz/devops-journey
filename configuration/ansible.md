# Ansible

## Useful Tips

- `ansible.builtin.command` does not support shell operators like `| & ; ...`. Every command needs to be its own command.
- When using `AWS`, ensure that `ansible` uses the correct user. 
- `HostKeyChecking` is an annoying issue, when spawning new EC2 Instances. The new key always needs to be acknowledged every time.
  - Solution: Prepend `ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook [...]`

## FAQ

##### How to deploy pubkeys to remote machine?

- With `cloud-init` images the keys can be downloaded from Github or other platforms
- Manual execute `ssh-copy-id $USER@$HOSTNAME`

##### How to handle HostKeyChecking?

- See [Documentation](https://docs.ansible.com/ansible/latest/user_guide/connection_details.html#managing-host-key-checking)
