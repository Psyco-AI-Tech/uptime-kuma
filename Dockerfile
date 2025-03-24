FROM node:20-alpine AS builder

WORKDIR /app
RUN apk add --no-cache git bash
COPY . .
RUN npm ci && npm run setup
FROM node:20-alpine

WORKDIR /app

ENV NODE_ENV=production
COPY --from=builder /app /app
EXPOSE 3001
CMD ["node", "server/server.js"]
