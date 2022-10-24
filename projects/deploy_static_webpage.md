# Create a Simple Pipeline for Frontend Development & Deployment

For this task, setup the revision control system, when checked-in, the pipeline is setup to deploy the website.
This task is similar to the [Cloud Resume Challenge](https://cloudresumechallenge.dev), however in this case, there should be no backend.
This task is also regularly suggested on [reddit.com/r/devops](https://reddit.com/r/devops)

## Steps

1. Create a website, which is maintained via git
2. Create a webserver setup, which can serve the website
   -  AWS Instance
   -  Docker Service
3. Change something on the website
4. Commit and push any changes
5. The old version of the website should be replaced by the newer version
6. Visually inspect the changes

## Learning Goals
- Create a Webserver setup
- Maintain a Website
- Connect the Revision Control System with Automation capabilities.
- Automatic deployment of the website to any provider. 


## Further Improvements
- Create a new cloud instance every time you deploy
  - Fix the DNS Entry, to resolve the correct IP Address
- Introduce errors on the website and check that it does not get deployed.
  - Introduce faulty HTML
  - Make some JS fail