# Use the official Nginx image as the base
FROM public.ecr.aws/nginx/nginx:1.27-alpine
# Set a working directory
WORKDIR /usr/share/nginx/html

# Remove default nginx index page
RUN rm -rf ./*

# Copy your static website or app content into the container
COPY ./html/ .

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
