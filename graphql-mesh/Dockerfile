FROM node
COPY . .
RUN yarn install 
USER 10001
CMD ["sh", "-c", "sleep 30 && yarn start"]
