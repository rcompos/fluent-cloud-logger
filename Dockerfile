FROM fluent/fluentd:v1.11.5-1.0
MAINTAINER YOUR_NAME <roncompos@lucidmotors.com>

USER root

RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev \
 # cutomize following instruction as you wish
 #&& sudo gem install fluent-plugin-elasticsearch \
 # && sudo fluent-gem install fluent-plugin-webhdfs \
 && sudo fluent-gem install fluent-plugin-s3 \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /home/fluent/.gem/ruby/2.5.0/cache/*.gem \
 && mkdir -p /fluentd/log/s3 \
 && chown -R fluent.fluent /fluentd

COPY fluent.conf /fluentd/etc/
COPY entrypoint.sh /bin/
RUN chmod +x /bin/entrypoint.sh

USER fluent
