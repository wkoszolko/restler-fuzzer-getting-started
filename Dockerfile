FROM mcr.microsoft.com/restlerfuzzer/restler:v7.4.0

ADD engine_deafult.json /RESTler/defaults/engine_deafult.json
ADD fuzz.sh /bin/fuzz
RUN chmod +x /bin/fuzz

VOLUME /fuzzer

WORKDIR /fuzzer
