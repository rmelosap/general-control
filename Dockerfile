# ❌ NÃO usar alpine → Prisma quebra por falta de OpenSSL compatível
FROM node:20-slim

WORKDIR /app

# Instala OpenSSL 3 (necessário para Prisma 5.22.x)
RUN apt-get update && \
    apt-get install -y openssl && \
    apt-get clean

# Copia apenas arquivos de dependências
COPY package*.json ./

# Instala dependências (incluindo devDependencies)
RUN npm install

# Copia o restante do código
COPY . .

# Gera Prisma Client
RUN npx prisma generate

# Build do TypeScript
RUN npm run build

# Força Prisma a usar o engine correto para OpenSSL 3
ENV PRISMA_CLI_QUERY_ENGINE_TYPE=binary
ENV PRISMA_CLI_SCHEMA_ENGINE_TYPE=binary
ENV PRISMA_QUERY_ENGINE_BINARY="linux-musl-openssl-3.0.x"
ENV PRISMA_SCHEMA_ENGINE_BINARY="linux-musl-openssl-3.0.x"

EXPOSE 3000

CMD ["npm", "start"]
