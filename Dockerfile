FROM node:20-alpine AS builder
WORKDIR /app

RUN apk add --no-cache git

COPY . .
RUN npm ci && npm run build

FROM node:20-alpine
WORKDIR /app
ENV NODE_ENV=production

COPY --from=builder /app /app

RUN apk add --no-cache git && npm run setup

EXPOSE 3001
CMD ["node", "server/server.js"]
