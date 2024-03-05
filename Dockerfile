FROM node:16-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

FROM node:16-alpine

WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules

EXPOSE 3000

CMD ["npm", "start"]