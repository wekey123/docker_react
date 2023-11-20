FROM node:19.5.0-alpine as builder
WORKDIR /frontend
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

# COPY ./ ./  no need COPY volumes reference is used
# CMD ["npm", "run", "start"]

FROM nginx
COPY --from=builder /frontend/build /usr/share/nginx/html