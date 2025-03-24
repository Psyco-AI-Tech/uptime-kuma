FROM node:20-alpine as builder

WORKDIR /app

COPY . .

RUN npm ci && npm run build

FROM node:20-alpine

WORKDIR /app

ENV NODE_ENV=production

COPY --from=builder /app /app

RUN npm prune --omit=dev

EXPOSE 3001

CMD [ "node", "server/server.js" ]
