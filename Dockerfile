FROM nginx:alpine

WORKDIR /usr/share/nginx/html
COPY . .

# Replace default Nginx listen port with Cloud Run PORT env variable (fallback 8080)
RUN sed -i "s/listen       80;/listen       ${PORT:-8080};/" /etc/nginx/conf.d/default.conf

# Expose default port (Cloud Run uses PORT env)
EXPOSE 8080
