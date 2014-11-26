# docker build -t lmarks/redmine-frontend .

FROM dockerfile/nginx
MAINTAINER Lenny Marks <lenny@lennymarks.com>

COPY nginx.conf /tmp/redmine.conf.template
COPY entrypoint.sh /

ENTRYPOINT ["sh", "/entrypoint.sh"]