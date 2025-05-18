# Stage 1: Build the app (optional if you already built it)
FROM node:20-alpine AS builder
WORKDIR /app
COPY . .
RUN npm install && npm run build -- --configuration production

# Stage 2: Serve app with Nginx
FROM nginx:stable-alpine
COPY dist/angular-playground/browser /usr/share/nginx/html

# Copy custom Nginx config (optional for SPA routing)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]