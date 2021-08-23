FROM node:14.17.5-alpine
WORKDIR /app
COPY package*.json .
RUN npm i
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
