FROM node:12-alpine
WORKDIR /validator-frontend
COPY ./build .
RUN npm i serve -g
CMD ["serve", "-s", "-l", "8081"]