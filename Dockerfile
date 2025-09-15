# Base image
FROM node:22 AS base
WORKDIR /app

# Install dependencies only once
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# Build stage (component will be selected dynamically)
FROM base AS builder
ARG COMPONENT
COPY . .
WORKDIR /app/components/${COMPONENT}
RUN npm run build

# Final stage
FROM node:22-alpine AS runtime
WORKDIR /app
ARG COMPONENT
COPY --from=builder /app/components/${COMPONENT}/dist ./dist
CMD ["node", "dist/index.js"]
