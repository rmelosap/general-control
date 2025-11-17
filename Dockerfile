FROM node:20-alpine

WORKDIR /app

# Copia dependências
COPY package*.json ./

# Instala dependências exatamente como no package-lock.json
RUN npm ci --omit=dev

# Copia o restante do código
COPY . .

# Gera o Prisma Client dentro da imagem
RUN npx prisma generate

# Transpila o TypeScript
RUN npm run build

EXPOSE 3000
# Comentario para forçar um novo build
CMD ["npm", "start"]
