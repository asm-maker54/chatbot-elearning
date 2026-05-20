FROM node:20-alpine
WORKDIR /app

# Copy package.json
COPY package.json ./

# Install dependencies with legacy peer deps to avoid conflicts
RUN npm install --legacy-peer-deps

# Copy the rest of the application
COPY . .

# Build the frontend
RUN npm run build

# Expose the port your Express server runs on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
