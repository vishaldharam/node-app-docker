# Stage 1: Build
FROM node:18-alpine AS builder

WORKDIR /app

# Copy package.json & package-lock.json first to leverage Docker layer caching
COPY package.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application files (ignores node_modules if .dockerignore is used)
COPY . .  

# Build the project (if required)
RUN npm run build

# Stage 2: Production
FROM node:18-alpine

WORKDIR /app

# Copy only necessary files from the builder stage
COPY --from=builder /app /app

# Expose port (if using Express or similar)
EXPOSE 3000

# Start the application
CMD ["node", "server.js"]
