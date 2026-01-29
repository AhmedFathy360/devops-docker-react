# Build stage
FROM node:alpine AS builder 
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Production image, copy all the files and run nginx
FROM nginx:1.25-alpine AS production
COPY --from=builder /app/build /usr/share/nginx/html