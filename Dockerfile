FROM node:22.9.0-alpine as build
WORKDIR /app/front
COPY package*.json ./
RUN npm install -g npm@latest
RUN npm i
COPY . .
RUN if [ "$NODE_ENV" = "dev" ]; then npm run dev; else npm run build; fi

FROM node:22.9.0-alpine as production
WORKDIR /app/front
COPY --from=build /app/front/.env ./.env
COPY --from=build /app/front/.next ./.next
COPY --from=build /app/front/public ./public
COPY --from=build /app/front/package*.json ./

RUN npm install -g npm@latest
RUN npm ci --omit=dev

EXPOSE 4000
CMD ["npm", "start"]
