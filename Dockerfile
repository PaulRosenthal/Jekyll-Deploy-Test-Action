FROM ruby:latest

COPY validate-jekyll-deploy.sh /validate-jekyll-deploy.sh
RUN apt -y update && apt -y install sudo ruby-full build-essential zlib1g-dev
RUN sudo gem install bundler --no-doc

ENTRYPOINT ["/validate-jekyll-deploy.sh"]
