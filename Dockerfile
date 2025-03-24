FROM node:20-alpine

WORKDIR /app
RUN apk add --no-cache git bash

COPY . .

ENV NODE_ENV=production
RUN npm ci
EXPOSE 3001
CMD npm run setup && node server/server.js
