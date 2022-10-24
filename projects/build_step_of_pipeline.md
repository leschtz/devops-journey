# Build Step of a Pipeline

The goal here is, that I create an cloud instance when needed, purely to compile some software.
Creating the infrastructure should be done in a bare method, purely with a scripting language. The advantage I see by doing it this way is, that Terraform or similar tools work similarly and abstract a level away. However, by being familiar with some essential tools, I can learn a lot. 

## Steps
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

## What tool to compile?
Any tool can be choosen, I fixed on some traditional tools, which I would use myself, where documentation is provided and which can be easily tested. 
I have chosen `zsh`.

### zsh 

#### Dependencies
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

## Learning Goals
- How to create an instance programmatically
- How to destroy an instance programmatically
- basic compilation processes
  - Handling dependencies for the compilation
- Transferring data between servers
- Some essential scripting via the command line.

## Useful Tools

- Shell Scripting
  - `aws cli`
- AWS Free Tier

## Next Steps/Further Improvements
- Create the instance via an "Infrastructure as Service (IaC)" tool
- Seperate the steps into a pipeline, to see which stage is failing
- Introduce better error handling
- Implement the solution via a programming API
  - Boto3