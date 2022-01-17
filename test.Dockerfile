FROM haxe:latest
WORKDIR /usr/src/app

RUN apt update && apt install nodejs npm git 

COPY res ./res
COPY src ./src
COPY user ./user
COPY build-*.hxml ./
COPY package*.json ./
COPY default-config.json ./

RUN npm ci; \
    haxelib install all --always; \
    haxe build-all.hxml

EXPOSE 4200

CMD npm start