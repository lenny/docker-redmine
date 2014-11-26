# docker build -t lmarks/redmine-appserver:1.0 .

FROM ubuntu:14.04
MAINTAINER Lenny Marks <lenny@lennymarks.com>

ENV INSTALL_DIR /opt/apps
ENV REDMINE_DIR $INSTALL_DIR/redmine
ENV REDMINE_VERSION 1a6b7e2a6064e58f383a4546533e745667ab18a2
ENV UNICORN_VERSION 4.8.3

RUN apt-get update && apt-get install -y \
	build-essential \
	libmysqlclient-dev \
	git-core \
	ruby1.9.1 \
	ruby1.9.1-dev
	
RUN gem install bundler
	
RUN mkdir $INSTALL_DIR && \
	cd $INSTALL_DIR && \
	git clone https://github.com/redmine/redmine.git && \
	cd $REDMINE_DIR && \
	git reset --hard $REDMINE_VERSION && \
	rm -rf $REDMINE_DIR/.git && \
	apt-get purge -y --auto-remove git-core
	
WORKDIR $REDMINE_DIR

# redmine Gemfile reads database.yml to determine db driver
COPY database.yml $REDMINE_DIR/config/

RUN echo "gem 'unicorn', '$UNICORN_VERSION'" >> Gemfile && \
	bundle install --without='test development rmagick'
	
RUN rake generate_secret_token
	
COPY unicorn.rb $REDMINE_DIR/
COPY additional_environment.rb $REDMINE_DIR/config/
COPY entrypoint.sh /
	
ENTRYPOINT ["sh", "/entrypoint.sh"]

VOLUME $REDMINE_DIR/public
EXPOSE 3000
