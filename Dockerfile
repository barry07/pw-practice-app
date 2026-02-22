# use nodejs to buils the angular app
FROM node:20 as build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install --force
COPY . .
# the app is designed to run via 'npm start'for practice
EXPOSE 4200
CMD ["npm", "start", "--", "--host", "0.0.0.0"]