FROM node:20-slim

WORKDIR /app

# Instala OpenSSL 3 (compatível com Prisma 5.22)
RUN apt-get update && \
    apt-get install -y openssl && \
    apt-get clean

# Copia apenas arquivos de dependências
COPY package*.json ./

# Instala dependências (incluindo devDependencies)
RUN npm install

# Copia o restante do código
COPY . .

# Gera Prisma Client dentro da imagem
RUN npx prisma generate

# Build do TypeScript
RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
