# Étape 1 : Build
FROM node:16-alpine AS builder

WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .

# Étape 2 : Runtime minimal
FROM alpine:3.16

RUN apk add --no-cache nodejs npm && \
    addgroup -S appgroup && adduser -S appuser -G appgroup

USER appuser
WORKDIR /app

COPY --from=builder /app ./
EXPOSE 3000

CMD ["node", "app.js"]
