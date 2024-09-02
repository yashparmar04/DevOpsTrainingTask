# Use a base image
FROM node:14

# Set working directory
WORKDIR /app

# Copy application files
COPY . .

# Install dependencies
RUN npm install

# Expose port
EXPOSE 8080

# Start the application
CMD ["npm", "start"]
