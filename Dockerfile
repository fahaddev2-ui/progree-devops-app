# ============================================
# STAGE 1: BUILDER
# Full environment to install dependencies
# ============================================
FROM node:18-alpine AS builder

# Set working directory inside container
WORKDIR /app

# Copy package files FIRST (layer caching)
# If these don't change, Docker skips npm install on rebuild
COPY package*.json ./

# Install all dependencies
RUN npm install

# Copy the rest of the source code
COPY . .

# ============================================
# STAGE 2: PRODUCTION
# Lean final image — only what's needed to RUN
# ============================================
FROM node:18-alpine AS production

# Security: run as non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

# Copy ONLY production artifacts from builder stage
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/server.js .
COPY --from=builder /app/package.json .

# Set environment variables (Docker injects these at runtime)
ENV NODE_ENV=production
ENV PORT=3000

# Switch to non-root user (security best practice)
USER appuser

# Document which port the container listens on
EXPOSE 3000

# Health check — Docker monitors this automatically
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3000/health || exit 1

# Start the app
CMD ["node", "server.js"]