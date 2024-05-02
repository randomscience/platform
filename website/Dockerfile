FROM node:20
WORKDIR app
COPY public/ public/
COPY src/ src/
COPY .eslintrc.js .eslintrc.js
COPY package.json package.json
COPY package-lock.json package-lock.json
COPY astro.config.mjs astro.config.mjs
COPY tailwind.config.js tailwind.config.js
RUN npm install
RUN npm run build
