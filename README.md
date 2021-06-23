# RESTler Fuzzer Getting Started 

The main goal of this repository is providing easy to use docker image with RESTler fuzzer.

This docker image should be used as black box solution and it could be used on your local machine or your CI/CD. 
If you use Azure services or GitHub, I encourage you to take a look at [REST API Fuzz Testing (RAFT)](https://github.com/microsoft/rest-api-fuzz-testing). 

## RESTler Fuzzer

RESTler is the first stateful REST API fuzzing tool for automatically testing cloud services through their REST APIs and finding security and reliability bugs in these services.
In order to find more details about RESTler you should check out [RESTler github repository](https://github.com/microsoft/restler-fuzzer).

## How to build docker image
```shell script
docker build -t wkoszolko/restler-fuzzer-getting-started .
```
## How to use

```shell script
docker run --rm -v $(pwd):/fuzzer:rw wkoszolko/restler-fuzzer-getting-started fuzz --api_spec=api-docs.json
```

Before you try to work with this docker image, I encourage you to take a look at provided examples:
- [simple api](examples/simple-api-without-additional-configuration/README.md)
- [dockerized api with custom configuration](examples/custom-dictionary-and-engine-configuration/README.md)

Docker image`restler-fuzzer-getting-started` supports parameters:

| Parameter name | Required  | Description |
|-------|----|---|
| api_spec | false | Path to Swagger specification. |
| compilation_config | false | Compilation configuration. One parameter of (api_spec, compilation_config) has to be set. Both api_spec and compilation_config can not be set at the same time. |
| dictionary_file | false | Path to dictionary file. |
| settings | false | Path to engine configuration. |
| no_ssl | false | Possible values: **true**/**false**. Disable SSL. If your API is expose over HTTP, you should use this flag. |
## Future improvements

- push docker image to Docker Hub
- add CI/CD
- add a new parameter `url` in order to override API url
- add ability to run only `smoke-test` `fuzz` or `fuzz-lean`
- add ability to fetch swagger/OpenApi docs from web
- extend information regarding RESTler
- explain how to analyze RESTler output
- explain common problems of docker network 
- use `getopt` in startups script instead of custom code for parsing input parameters 
- add example with authentication


   
