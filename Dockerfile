# Use an existing docker image as a base
FROM node:12-alpine as builder
#
#-----------------------------------------------------------
#Specify Working directory
#
WORKDIR '/app'
#
#
#-----------------------------------------------------------
# Download and install a dependency
COPY package.json .
RUN npm install
COPY . .
#
#
#-----------------------------------------------------------
# Tell the image what to do when it starts as a container
CMD npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

