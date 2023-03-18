# Ubuntu Node.js Dockerfile
# Pull base image.
FROM ubuntu:20.04

# Install Node.js
RUN apt-get install --yes curl
RUN curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash -
RUN apt-get install --yes nodejs
RUN apt-get install --yes build-essential

# Working directory
WORKDIR /home/node/app

# Bundle app source
COPY . /src

# Install app dependencies
RUN cd /src
RUN npm install

# Binds to port 8080, 8000
EXPOSE  8080
EXPOSE  8000

#  Defines your runtime(define default command)
# These commands unlike RUN (they are carried out in the construction of the container) are run when the container
CMD ["node", "/src/index.js"]