# Use official nginx image
FROM nginx:alpine

# Copy custom html into nginx default html folder
COPY html /usr/share/nginx/html
