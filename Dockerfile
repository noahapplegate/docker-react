# Build react app
#-----------------------------
FROM node:alpine AS builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

CMD npm run build

# Run the build on nginx
#------------------------------
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

# Note: nginx image will automatically run nginx by default
