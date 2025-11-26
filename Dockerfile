# Use a stable Node.js image
FROM node:20-bullseye

WORKDIR /app

# Copy package files first
COPY package*.json ./

# Clean cache & install dependencies
RUN npm cache clean --force
RUN npm install --production --legacy-peer-deps

# Copy rest of app
COPY . .

EXPOSE 3000

CMD ["node", "index.js"]
