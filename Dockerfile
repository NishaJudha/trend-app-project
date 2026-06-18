FROM nginx:alpine

COPY dist /usr/share/nginx/html
=======
FROM node:18 AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Stage 2: Production
FROM nginx

COPY dist/ /usr/share/nginx/html/
>>>>>>> b52b19e (Add Dockerfile and Jenkinsfile)

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

