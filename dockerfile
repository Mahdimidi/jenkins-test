FROM node:14.15.4 as builder
WORKDIR /app
COPY package*.json ./
RUN npm install @angular/cli
RUN npm install --no-package-lock
COPY . .
RUN npm run build --force
RUN ls
FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
