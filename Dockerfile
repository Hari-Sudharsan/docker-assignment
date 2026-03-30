FROM nginx:latest

# Remove default nginx website (optional but clean)
RUN rm -rf /usr/share/nginx/html/*

# Copy your HTML file to nginx directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80
