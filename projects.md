## Compile a tool on a cloud based instance and provide the binary

The goal here is, that I create an cloud instance when needed, to create the binary I want. 

### General Steps
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
- git
- zsh
- zlib

### Learning Goals
- how to create an instance programmatically
- how to destroy an instance programmatically
- basic compilation processes
  - how to handle dependencies


### Further Steps
- create the instance via an "Infrastructure as Service (IaC)" tool
- 