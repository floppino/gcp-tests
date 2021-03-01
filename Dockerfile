FROM bitnami/node:9 as builder
ENV NODE_ENV="production"

# Copy app's source code to the /app directory
COPY . /app

# The application's directory will be the working directory
WORKDIR /app

# Install Node.js dependencies defined in '/app/packages.json'
RUN npm install

FROM bitnami/node:9-prod
ENV NODE_ENV="production"
COPY --from=builder /app /app
WORKDIR /app
ENV PORT 5001
EXPOSE 5001

# Start the application finally3
CMD ["npm", "start"]