FROM node:20-alpine

WORKDIR /app

# Copy package.json only (no package-lock.json)
COPY package.json ./
COPY .npmrc ./

# Install all dependencies including devDependencies needed for build
RUN npm install --legacy-peer-deps

# Copy rest of the source code
COPY . .

# Build the frontend with Vite
RUN npm run build

# Expose port
EXPOSE 3000

# Start Express server
CMD ["node", "--import", "tsx/esm", "server.ts"]
