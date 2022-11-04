# Build Phase
FROM node:16-alpine as builder
WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# Run Phase
FROM nginx
# from other build phase and the folder /app/build
# to /usr/share/nginx/html (documentation HUB Docker of nginx)
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
