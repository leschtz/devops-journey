# Ansible


- `ansible.builtin.command` does not support shell operators like `| & ; ...`. Every command needs to be its own command.
- When using `AWS`, ensure that `ansible` uses the correct user. 
- `HostKeyChecking` is an annoying issue, when spawning new EC2 Instances. The new key always needs to be acknowledged every time.
  - Solution: Prepend `ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook [...]`