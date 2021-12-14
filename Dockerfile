# 1st Phase

# tag as "builder"
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


# 2nd Phase

FROM nginx

# This does nothing for us locally.  Used by AWS elasticbeanstalk
EXPOSE 80

COPY --from=builder  /app/build /usr/share/nginx/html

# Default start command of nginx base image starts NGINX
# so no RUN command is needed
