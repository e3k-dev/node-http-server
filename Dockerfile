FROM node:current-bullseye-slim
EXPOSE 80

# alias for root
RUN echo "alias ll='ls -l --color=auto --human-readable'" >> /root/.bashrc && echo "alias ls='ls --color=auto'" >> /root/.bashrc && echo "alias ..='cd ..'" >> /root/.bashrc

# http-server
RUN npm install -g http-server

# web
RUN mkdir -p /opt/www
COPY index.html /opt/www/index.html

COPY init.sh /
RUN ["chmod", "+x", "/init.sh"]

ENTRYPOINT ["/init.sh"]
