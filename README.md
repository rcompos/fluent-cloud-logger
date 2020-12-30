# Fluent Logger

Provides log aggregation with Fluent.

## Description ##

Fluent service provides log aggregation using input, output and parsing plugins.

## Build & Run ##

To get fluent-logger running with minimal effort run the docker image.  Provide envvars for AWS credentials file.

```
docker build -t fluentd-logger:latest ./  
docker run --rm -it --name fluent-logger -v $(pwd)/log:/fluentd/log -p 5140:5140/tcp -p 5140:5140/udp --env-file=/path/to/env fluentd-logger:latest
```

## Usage

## Testing

Where fluent-logger is hostname of the fluent logger service.

```
logger -p local0.debug -n fluent-logger -P 5140 -t system "syslog test syslog"
```

Generate multiple syslog messages.
```
for i in {1..1000}; do logger -p local0.debug -n fluent-logger -P 5140 -t system "Test $i syslog -> fluentd -> s3"; done
```

## Notes

Source of docker image:  
https://github.com/fluent/fluentd-docker-image  
`curl https://raw.githubusercontent.com/fluent/fluentd-docker-image/master/Dockerfile.sample > Dockerfile`  
