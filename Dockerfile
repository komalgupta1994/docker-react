#use alpine as base image to build
FROM node:14-alpine as builder
WORKDIR '/app'
COPY ./package.json ./
RUN npm i
COPY ./ ./  
RUN npm run build

# Now use nginx to run the code
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html