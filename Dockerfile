# Stage 1: Build the TypeScript app
ARG DYNATRACE_ENVIRONMENT_URL=""

FROM node:18 AS build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the TypeScript app
RUN npm run build

# Stage 2: Run the optimized JavaScript app
FROM node:18 AS production
# Copy the rest of the application code
# Download and install Dynatrace OneAgent
# Ref https://docs.dynatrace.com/docs/ingest-from/setup-on-container-platforms/docker/set-up-dynatrace-oneagent-as-docker-container
COPY --from=san35248.sprint.dynatracelabs.com/linux/oneagent-codemodules:nodejs / /
ENV LD_PRELOAD=/opt/dynatrace/oneagent/agent/lib64/liboneagentproc.so


# Set the working directory in the container
WORKDIR /app

# Copy the built JavaScript files from the previous stage
COPY --from=build /app/dist ./
COPY package*.json ./

# Install only production dependencies
RUN npm install --only=production
RUN ls -a 
RUN pwd 
# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["node", "index.js"]