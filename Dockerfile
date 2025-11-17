FROM node:20-alpine

# Diretório de trabalho dentro do container
WORKDIR /app

# Copia apenas arquivos de dependências primeiro (melhora cache)
COPY package*.json ./

# Instala dependências
RUN npm install

# Copia todo o restante do código
COPY . .

# Gera o build TypeScript → JavaScript
RUN npm run build

# Expõe a porta que o Express vai ouvir dentro do container
EXPOSE 3000

# Comando que irá iniciar o servidor
CMD ["npm", "start"]
