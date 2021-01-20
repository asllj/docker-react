FROM node:alpine 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <-- all the stuff we care about
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
#nginx image will start the nginx for us. so i don't need to add here a new command to start the nginx