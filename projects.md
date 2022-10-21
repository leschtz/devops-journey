# Projects
- [Projects](#projects)
  - [Compile a tool on a cloud based instance and provide the binary](#compile-a-tool-on-a-cloud-based-instance-and-provide-the-binary)
    - [Steps](#steps)
    - [What tool to compile?](#what-tool-to-compile)
      - [zsh](#zsh)
        - [Dependencies](#dependencies)
    - [Learning Goals](#learning-goals)
    - [Useful Tools](#useful-tools)
    - [Next Steps/Further Improvements](#next-stepsfurther-improvements)
  - [Create a simple pipeline for Frontend Development](#create-a-simple-pipeline-for-frontend-development)
    - [Steps](#steps-1)
    - [Learning Goals](#learning-goals-1)
    - [Further Improvements](#further-improvements)
  - [Create a REST API and use a database for storage](#create-a-rest-api-and-use-a-database-for-storage)
    - [Steps](#steps-2)
    - [Learning Goals](#learning-goals-2)
    - [Useful Tools](#useful-tools-1)
    - [Next Steps/Further Improvements](#next-stepsfurther-improvements-1)
  - [Create multiple webservers and hide them behinde a load balancer](#create-multiple-webservers-and-hide-them-behinde-a-load-balancer)
    - [Steps](#steps-3)
    - [Learning Goals](#learning-goals-3)
    - [Useful Tools](#useful-tools-2)
    - [Next Steps/Further Improvements](#next-stepsfurther-improvements-2)
  - [Handle Version Differences](#handle-version-differences)
    - [Steps](#steps-4)
    - [Learning Goals](#learning-goals-4)
    - [Useful Tools](#useful-tools-3)
    - [Next Steps/Further Improvements](#next-stepsfurther-improvements-3)
  - [Project Template](#project-template)
    - [Steps](#steps-5)
    - [Learning Goals](#learning-goals-5)
    - [Useful Tools](#useful-tools-4)
    - [Next Steps/Further Improvements](#next-stepsfurther-improvements-4)

## Compile a tool on a cloud based instance and provide the binary

The goal here is, that I create an cloud instance when needed, purely to compile some software.
Creating the infrastructure should be done in a bare method, purely with a scripting language. The advantage I see by doing it this way is, that Terraform or similar tools work similarly and abstract a level away. However, by being familiar with some essential tools, I can learn a lot. 

### Steps
1. Create the Cloud Instance
2. Transfer the data to compilation.
   - checkout via git
   - transfer via scp
   - wget from a website
3. Install all dependencies
4. Compile
5. Download binary
6. Terminate the cloud instance
7. Test binary
   - via a docker container
   - test it on the bare-bone machine

### What tool to compile?
Any tool can be choosen, I fixed on some traditional tools, which I would use myself, where documentation is provided and which can be easily tested. 
I have chosen `zsh`.

#### zsh 

##### Dependencies
- Toolchain: `gcc git make autoconf`
- Development files: `libncurses-dev` 

```sh
# information about the process can be found in INSTALL
git clone git://git.code.sf.net/p/zsh/code zsh
./Util/preconfig
./configure --disable-dynamic # create a standalone binary

make
make check 

# find the binary in ./Src/zsh
# make install # not needed in this case, getting the binary is enough
```

### Learning Goals
- How to create an instance programmatically
- How to destroy an instance programmatically
- basic compilation processes
  - Handling dependencies for the compilation
- Transferring data between servers
- Some essential scripting via the command line.

### Useful Tools

- Shell Scripting
  - `aws cli`
- AWS Free Tier

### Next Steps/Further Improvements
- Create the instance via an "Infrastructure as Service (IaC)" tool
- Seperate the steps into a pipeline, to see which stage is failing
- Introduce better error handling
- Implement the solution via a programming API
  - Boto3


## Create a simple pipeline for Frontend Development

For this task, setup the revision control system, when checked-in, the pipeline is setup to deploy the website.
This task is similar to the [Cloud Resume Challenge](https://cloudresumechallenge.dev), however in this case, there should be no backend.
This task is also regularly suggested on [reddit.com/r/devops](https://reddit.com/r/devops)

### Steps

1. Create a website, which is maintained via git
2. Create a webserver setup, which can serve the website
   -  AWS Instance
   -  Docker Service
3. Change something on the website
4. Commit and push any changes
5. The old version of the website should be replaced by the newer version
6. Visually inspect the changes

### Learning Goals
- Create a Webserver setup
- Maintain a Website
- Connect the Revision Control System with Automation capabilities.
- Automatic deployment of the website to any provider. 


### Further Improvements
- Create a new cloud instance every time you deploy
  - Fix the DNS Entry, to resolve the correct IP Address
- Introduce errors on the website and check that it does not get deployed.
  - Introduce faulty HTML
  - Make some JS fail

## Create a REST API and use a database for storage

The user creates a REST API, which then goes on to store data in some database. The database and webservice should not be on hosted on the same machine. Enable the service to deploy new changes to the API automatically. Check that you do not introduce any breaking changes. Remove the DB Service and see how your service reacts.

### Steps

- todo: highlight the most important steps for this project

### Learning Goals

- How to setup a backend service
- How to setup a Database
- How to connect the backend with the database
- 

### Useful Tools

- Python
  - Flask
- MongoDB, Postgre
- Terraform, AWS CLI 
- Docker, 

### Next Steps/Further Improvements

- Introduce an alerting mechanism with your services, to get insights about their usage
  - Database is filling up the local storage
  - The webservice can't connect to the DB
  - DB is suddenly not available
  - Number of request is getting too high
- Deploy the DB and the API in different regions
- Make the DB inaccesible from the outside, it only should connect to the webservice directly.
  
## Create multiple webservers and hide them behinde a load balancer 

Easy as that. Create multiple Linux instances, configure them to use 

### Steps

1. Create a template for the Instances
2. Spawn many Instances and configure their network
3. Automatically install the webservice on the machines
4. Set some correct domains, to be able to resolve the machines
5. Setup the loadbalancer 
 
### Learning Goals

- Configure many systems exactly the same
- Create a redundant system

### Useful Tools

- Virtualization: KVM, Docker, Virtualbox
- Configuration: Ansible, Puppet
- Webserver: nginx, Apache

### Next Steps/Further Improvements

- Configure a firewall to keep your instances more secure
  - Only allow a certain IP range to access the instances via SSH
- Deploy the webservers on different Linux distributions
- Mix Docker machines with VMs as webservers
- What happens if you remove a machine? How does the loadbalancer handle this?
- What Software can you choose for load balancing?
- Do Cloud Providers have load balancers available?

## Handle Version Differences

Creating software may needs to be compatible with different versions, standards or operating systems. There the goal is to provide a matrix pipeline, running on different OS and different versions for the interpreter/compiler

### Steps

- Create some software, which works with one version for a tool
- Create a pipeline for this single version
- Introduce antother change, which may be available with another version
- Update the pipeline to run additional version
- See how it breaks
- Repair.

### Learning Goals

- How to handle different versions of some software tool
- Matrix-Pipelines

### Useful Tools

- Python3.6 .. Python3.10 as an interpreter
- Ubuntu 22.04, Ubuntu 18.10, ...

### Next Steps/Further Improvements

- Include a Framework, which you did not create, which introduced breaking changes
- Handle different Operating Systems, Linux AND Windows.
  - Think of file handling/directory names and restrictions to introduce issues

## Project Template

- todo: describe the general idea of this task

### Steps

- todo: highlight the most important steps for this project

### Learning Goals

- todo: describe the learning outcome when this task is implemented

### Useful Tools

- todo: describe what tools can be used here. Think of Github, Scripting Languages, Frameworks, Cloud Providers, ....

### Next Steps/Further Improvements

- todo: describe how this project could be improved additionally