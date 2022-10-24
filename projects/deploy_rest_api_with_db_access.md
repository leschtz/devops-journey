# Create a REST API and use a Database for Storage

The user creates a REST API, which then goes on to store data in some database. The database and webservice should not be on hosted on the same machine. Enable the service to deploy new changes to the API automatically. Check that you do not introduce any breaking changes. Remove the DB Service and see how your service reacts.

## Steps

- todo: highlight the most important steps for this project

## Learning Goals

- How to setup a backend service
- How to setup a Database
- How to connect the backend with the database
- 

## Useful Tools

- Python
  - Flask
- MongoDB, Postgre
- Terraform, AWS CLI 
- Docker, 

## Next Steps/Further Improvements

- Introduce an alerting mechanism with your services, to get insights about their usage
  - Database is filling up the local storage
  - The webservice can't connect to the DB
  - DB is suddenly not available
  - Number of request is getting too high
- Deploy the DB and the API in different regions
- Make the DB inaccesible from the outside, it only should connect to the webservice directly.
  