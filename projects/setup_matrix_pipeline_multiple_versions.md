# Handle Version Difference

Creating software may needs to be compatible with different versions, standards or operating systems. There the goal is to provide a matrix pipeline, running on different OS and different versions for the interpreter/compiler

## Steps

- Create some software, which works with one version for a tool
- Create a pipeline for this single version
- Introduce antother change, which may be available with another version
- Update the pipeline to run additional version
- See how it breaks
- Repair.

## Learning Goals

- How to handle different versions of some software tool
- Matrix-Pipelines

## Useful Tools

- Python3.6 .. Python3.10 as an interpreter
- Ubuntu 22.04, Ubuntu 18.10, ...

## Next Steps/Further Improvements

- Include a Framework, which you did not create, which introduced breaking changes
- Handle different Operating Systems, Linux AND Windows.
  - Think of file handling/directory names and restrictions to introduce issues