# Stage 1: Build
FROM node:18-alpine as build
WORKDIR /app
COPY package*.json ./

# Add the flag here to bypass the version conflict
RUN npm install --legacy-peer-deps
COPY . .
RUN npm run build --configuration=production

# Stage 2: Serve
FROM nginx:alpine
# this copies pre-built files straight into Nginx
COPY ./dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]