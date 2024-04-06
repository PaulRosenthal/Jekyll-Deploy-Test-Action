FROM ubuntu:rolling

COPY validate-jekyll-deploy.sh /validate-jekyll-deploy.sh
RUN apt -y update && apt -y install build-essential zlib1g-dev
# Intall Ruby Version Manager (RVM)
RUN sudo apt-get install software-properties-common && sudo apt-add-repository -y ppa:rael-gc/rvm && sudo apt-get update && sudo apt-get install rvm && sudo usermod -a -G rvm $USER
# Install Ruby 3.3.0
RUN rvm install 3.3.0 && rvm use 3.3.0
RUN sudo gem install bundler --no-doc

ENTRYPOINT ["/validate-jekyll-deploy.sh"]
