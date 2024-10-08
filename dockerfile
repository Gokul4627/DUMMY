# # Use the official Flutter base image
# FROM awcdigital/flutter-sdk3.22.2:0.0.1

# # Set the working directory
# WORKDIR /app

# # Copy your Flutter web app source code into the container
# COPY .. /app/
# # To resolve the dependcies
# RUN flutter pub get 
# # Build the Flutter web app
# RUN flutter build web

# Stage 2: Set up NGINX to serve the build files
#FROM nginx:latest

# Copy the build files from the Flutter container to NGINX
#COPY --from=0 /app/build/web /usr/share/nginx/html

# Expose port 80 (default for NGINX)
#EXPOSE 80

# Start NGINX
#CMD ["nginx", "-g", "daemon off;"]

FROM alpine:latest

RUN apk add --no-cache nginx

COPY nginx.conf /etc/nginx/nginx.conf

# Copy the build files from the Flutter container to NGINX
#COPY --from=0 /app/build/web /usr/share/nginx/html
COPY .. /usr/share/nginx/html

#COPY .. /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]


