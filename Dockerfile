FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

# Clean cache & install dependencies
RUN npm cache clean --force
RUN npm install --production --legacy-peer-deps

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
