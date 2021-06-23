#!/bin/sh

no_ssl=""
api_spec=""
compilation_config=""
grammar_file=./Compile/grammar.py
dictionary_file=./Compile/dict.json
settings=/RESTler/defaults/engine_deafult.json

while [ $# -gt 0 ]; do
  case "$1" in
    --api_spec=*)
      api_spec="--api_spec ${1#*=}"
      ;;
    --grammar_file=*)
      grammar_file="${1#*=}"
      ;;
    --dictionary_file=*)
      dictionary_file="${1#*=}"
      ;;
    --compilation_config=*)
      compilation_config="${1#*=}"
      ;;
    --settings=*)
      settings="${1#*=}"
      ;;
    --no_ssl=true)
      no_ssl="--no_ssl"
      ;;
    *)
      echo "****************************"
      echo "*Error: Invalid argument:$1"
      echo "****************************"
      exit 1
  esac
  shift
done
echo "Run RESTler with params: $compilation_config $api_spec --grammar_file $grammar_file --dictionary_file $dictionary_file --settings $settings $no_ssl"

dotnet /RESTler/restler/Restler.dll compile $compilation_config $api_spec
dotnet /RESTler/restler/Restler.dll test --grammar_file $grammar_file --dictionary_file $dictionary_file --settings $settings $no_ssl
dotnet /RESTler/restler/Restler.dll fuzz --grammar_file $grammar_file --dictionary_file $dictionary_file --settings $settings $no_ssl
