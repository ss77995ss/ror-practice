FROM ruby:2.1

MAINTAINER Chloe

# make sure apt is up to date
RUN apt-get update
RUN apt-get install sudo -y
RUN sudo apt-get install nodejs -y
RUN apt-get install vim -y

# Create project directory
RUN mkdir -p /auto_stock_server
WORKDIR /auto_stock_server

# Install project dependencies
ADD ./build.sh /auto_stock_server
RUN /bin/bash -c "./build.sh"

#COPY Gemfile* ./
#RUN bundle install
#COPY . .

EXPOSE 3000

# docker build --build-arg NODE_ENV="development" -t chloe/ror-practice-dev .
# docker exec -it ror-practice-dev /bin/bash
