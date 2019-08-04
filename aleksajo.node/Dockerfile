FROM node:12.6.0

RUN apt-get update && apt-get install -y git

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

COPY package.json /var/www/html

RUN npm install
RUN npm install -g @angular/cli@8.0.1
