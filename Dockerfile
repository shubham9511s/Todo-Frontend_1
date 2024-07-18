#Stage 1: Build stage
FROM nginx:alpine

#Overwrite default Nginx configuration to set index.html as default
COPY nginx.conf /etc/nginx/nginx.conf

#Copy all HTML files from the current directory into a temporary directory
COPY . /usr/share/nginx/html/app

#Expose port 80 to allow external access to the Nginx server
EXPOSE 80

#Command to start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]



#################################################################################



# # Stage 1: Build stage
# FROM nginx:alpine AS builder

# # Overwrite default Nginx configuration to set index.html as default
# COPY nginx.conf /etc/nginx/nginx.conf

# # Copy all HTML files from the current directory into a temporary directory
# COPY . /usr/share/nginx/html/app

# # Stage 2: Production stage
# FROM nginx:alpine

# # Overwrite default Nginx configuration to set index.html as default
# COPY nginx.conf /etc/nginx/nginx.conf

# # Copy HTML files from the builder stage to the final Nginx server directory
# COPY --from=builder /usr/share/nginx/html/app /var/www/html

# # Expose port 80 to allow external access to the Nginx server
# EXPOSE 80

# # Command to start Nginx when the container runs
# CMD ["nginx", "-g", "daemon off;"]
