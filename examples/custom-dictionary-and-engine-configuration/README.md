# Test api with custom dictionary compile settings and engine configuration

This example demonstrates how to use a custom configuration in order to increase test coverage.
When swagger API specification doesn't provide examples, a user has to provide additional configuration files with a dictionary.

This example tests [spring-petclinic-rest](https://github.com/spring-petclinic/spring-petclinic-rest). 
The api runs inside docker. 

## How to run test

List of input files:
- `config.json`: [configuration of api compilation](https://github.com/microsoft/restler-fuzzer/blob/main/docs/user-guide/CompilerConfig.md) process
- `petclinic-swagger.json`: OpenApi definition of [spring-petclinic-rest](https://github.com/spring-petclinic/spring-petclinic-rest)
- `engine_settings.json`: [engine settings](https://github.com/microsoft/restler-fuzzer/blob/main/docs/user-guide/SettingsFile.md)
This config file ensures RESTler test only `api` paths 
- `dict.json`: [dictionary config file](https://github.com/microsoft/restler-fuzzer/blob/main/docs/user-guide/FuzzingDictionary.md)

```shell script
#run api under test
docker run -p 9966:9966 --name petclinic-rest springcommunity/spring-petclinic-rest

#run fuzzer with additional configuration
docker run --rm --link petclinic-rest -v $(pwd):/fuzzer:rw wkoszolkoo/restler-fuzzer-getting-started fuzz --compilation_config=config.json --dictionary_file=./dict.json --settings=./engine_settings.json --no_ssl=true

#cleanup
docker rm -f petclinic-rest
```
 
