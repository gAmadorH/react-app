# react-app

Dockerizing a React app using Docker multistage builds

## requirements

* node.js or nvm
* Docker and Docker compose

## Development process

### Create app

Install npm `create-react-app` module globally:

```bash
npm install -g create-react-app
```

Create app:

```bash
# npm init react-app <app-name> --use-npm
npm init react-app react-app --use-npm
cd react-app
```

### Dockerizing app

Create Docker and docker ignore files, docker-compose.yml file is just created to simplify:

`Dockerfile`:

```Dockerfile
FROM node:14.17.5-alpine
WORKDIR /app
COPY package*.json ./
RUN npm i
COPY . ./
EXPOSE 3000
CMD ["npm", "start"]
```

`.dockerignore`:

```plain
node_modules/
build/
.dockerignore
.editorconfig
.gitignore
.nvmrc
docker-compose.yml
Dockerfile
LICENSE
README.md
```

`.docker-compose.yml`:

```docker-compose
version: '3.7'

services:
  web:
    container_name: web
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - 3000:3000
    command: npm start
```

### Run app

Just run the command:

Using docker compose:

```bash
docker-compose up
```

Using docker:

```bash
docker build -t web:0.1 .
docker run --rm -p 3000:3000 web:0.1
```

## License

[MIT.](./LICENSE) Copyright (c)
