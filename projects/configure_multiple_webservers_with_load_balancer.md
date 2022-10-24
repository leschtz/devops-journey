# Create Multiple Webservers and Hide them Behind a Load Balancer 

Easy as that. Create multiple Linux instances, configure them to use 

## Steps

1. Create a template for the Instances
2. Spawn many Instances and configure their network
3. Automatically install the webservice on the machines
4. Set some correct domains, to be able to resolve the machines
5. Setup the loadbalancer 
 
## Learning Goals

- Configure many systems exactly the same
- Create a redundant system

## Useful Tools

- Virtualization: KVM, Docker, Virtualbox
- Configuration: Ansible, Puppet
- Webserver: nginx, Apache

## Next Steps/Further Improvements

- Configure a firewall to keep your instances more secure
  - Only allow a certain IP range to access the instances via SSH
- Deploy the webservers on different Linux distributions
- Mix Docker machines with VMs as webservers
- What happens if you remove a machine? How does the loadbalancer handle this?
- What Software can you choose for load balancing?
- Do Cloud Providers have load balancers available?

