# --- Étape 1 : build de l'application React ---
FROM node:24-alpine AS build

WORKDIR /app

COPY package.json ./
RUN npm install

COPY . .
RUN npm run build

# --- Étape 2 : image finale, ne contient que les fichiers statiques ---
FROM node:24-alpine

WORKDIR /app

RUN npm install -g serve@14

COPY --from=build /app/build ./build

EXPOSE 3000

USER node
CMD ["serve", "-s", "build", "-l", "3000"]
