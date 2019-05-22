FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY web /usr/share/nginx/html/
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
EXPOSE 80
