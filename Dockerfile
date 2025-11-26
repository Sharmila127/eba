# Use official Node.js 20 image (slim for smaller size)
FROM node:20-bullseye-slim

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first for caching
COPY package*.json ./

# Configure npm to avoid integrity errors and use legacy peer deps
RUN npm config set registry https://registry.npmjs.org/ \
    && npm cache clean --force \
    && npm install --production --legacy-peer-deps --force

# Copy the rest of the application
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Start the application
CMD ["node", "main-app.js"]
