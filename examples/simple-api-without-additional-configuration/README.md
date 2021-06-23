# Test api without additional fuzzer configuration

This example shows how to start using RESTler and test api based on OpenAPI/Swagger file.

## How to run test

List of input files:
- `api-docs.json`: OpenApi definition 

In order to compile api definition and start fuzzing, you need to invoke:
```shell script
docker run --rm -v $(pwd):/fuzzer:rw wkoszolko/restler-fuzzer-getting-started fuzz --api_spec=api-docs.json --no_ssl=true
```
 
