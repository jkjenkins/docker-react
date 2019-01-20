# Build Phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run Phase
FROM nginx
# Copy from another Phase
COPY --from=builder /app/build /usr/share/nginx/html
