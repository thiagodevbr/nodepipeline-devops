FROM node:14
RUN apt-get update && apt-get install git -y && apt-get install imagemagick -y;

WORKDIR /ecs-app

COPY package*.json ./
COPY . .

RUN npm install

ENV NODE_ENV=production
ENV ENV_ECS=true
USER node

EXPOSE 80

ENTRYPOINT ["npm", "start"]
