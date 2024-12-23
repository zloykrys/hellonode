FROM node

WORKDIR /app

COPY package.json ./
RUN npm install

COPY . .

EXPOSE 3621

CMD [ "node", "./main.js" ]
