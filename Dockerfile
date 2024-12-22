FROM registry.suse.com/bci/nodejs:20

WORKDIR /app

COPY package.json ./
RUN npm install

COPY . .

EXPOSE 3621

CMD [ "node", "./main.js" ]
