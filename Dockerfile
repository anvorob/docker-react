FROM node:16-alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 
#the build folder will be created in app.

FROM nginx
#copy files from builder stage after nginx is installed.
COPY --from=builder /app/build /usr/share/nginx/html

