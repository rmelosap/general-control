FROM node:20-alpine

WORKDIR /app

# Copia apenas os arquivos de dependência
COPY package*.json ./

# Instala todas as dependências (incluindo devDependencies)
RUN npm install

# Copia o restante do código
COPY . .

# Gera o Prisma Client
RUN npx prisma generate

# Gera o build do TypeScript
RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
