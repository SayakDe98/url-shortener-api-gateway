FROM node:24-alpine

WORKDIR /app

# Enable pnpm
RUN corepack enable

# Copy dependency files
COPY package.json pnpm-lock.yaml ./

# Install only production dependencies
RUN pnpm install --frozen-lockfile --prod

# Copy source code
COPY . .

EXPOSE 3000

CMD ["pnpm", "start"]