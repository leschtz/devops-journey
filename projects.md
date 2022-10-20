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
Any tool can be choosen, I fixed on some traditional tools, which I would use myself, where documentation is provided.

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
# make install
```


#### zlib

#### git

##### Dependencies
`libssl-dev`, `autoconf`, `libcurl4-openssl-dev`

### Learning Goals
- how to create an instance programmatically
- how to destroy an instance programmatically
- basic compilation processes
  - how to handle dependencies


### Further Steps
- create the instance via an "Infrastructure as Service (IaC)" tool
- seperate the steps into a pipeline, to see which stage is failing
- introduce some error checking in the process