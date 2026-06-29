FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . . 
FROM node:20-alpine
USER node
WORKDIR /app
COPY --from=builder --chown=node:node /app .
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 CMD wget -qO- http://localhost:3000/health || exit 1
CMD ["node","app.js"]