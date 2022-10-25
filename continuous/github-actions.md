## Resources

- Repository: [leschtz.me](https://github.com/leschtz/leschtz.github.io)
- [Workflow Documentation](https://docs.github.com/en/actions/using-workflows/about-workflows)

## Lessons Learned
- When a pipeline fails, it will abort. When using `upload-artifact`, one can use `conditionals` to upload in case of failure.
  - [Conditional Upload](https://github.com/actions/upload-artifact#conditional-artifact-upload)
  - Usage: 
  ```yaml
    - name: Upload Logfile
    uses: actions/upload-artifact@v3
    if: failure()
    ...
  ```
- Using predefined actions is easy, especially for something nicely integrated into Github as Github Pages
- Github Actions provides a nice Marketplace, where anyone can provide packages for pipelines. 
- `concurrency` in the top-level can be used to remove any running workflow by the one running right now. The feature relies on the `group` identifier. Setting `cancel-in-progress: true` removes any workflow running. This can be tested by spawning two jobs immediately afterwards.
- `workflow_dispatch` enables to run workflows manually.