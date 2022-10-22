FROM node:16-alpine AS runner

WORKDIR /app

RUN npm i -g pnpm

RUN echo 'strict-peer-dependencies=false' > .npmrc

COPY package.json pnpm-lock.yaml ./

RUN pnpm i

COPY . .

RUN npm run build

EXPOSE 3000

ENV PORT 3000

CMD ["npm", "run", "start"]
