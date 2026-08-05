FROM node:24-alpine

WORKDIR /app

# Enable pnpm
RUN corepack enable

# Copy dependency files
COPY package.json pnpm-lock.yaml ./

# Install only production dependencies
RUN pnpm install --frozen-lockfile --prod --config.dangerously-allow-all-builds=true

# Copy source code
COPY . .

EXPOSE 3000

CMD ["pnpm", "start"]