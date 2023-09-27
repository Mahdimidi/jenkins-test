# Utilisation de l'image Node.js officielle en tant qu'image de base
FROM node:14 as builder

# Définition du répertoire de travail dans le conteneur
WORKDIR /app

# Copie du fichier package.json et package-lock.json
COPY package*.json ./

# Installation des dépendances
RUN npm install

# Copie des fichiers de l'application
COPY . .

# Construction de l'application Angular
RUN npm run build

# Étape de production
FROM nginx:alpine

# Copie des fichiers de build de l'application Angular depuis l'étape précédente
COPY --from=builder /app/dist /usr/share/nginx/html

# Configuration du serveur web Nginx
EXPOSE 80

# Commande pour démarrer le serveur Nginx
CMD ["nginx", "-g", "daemon off;"]
