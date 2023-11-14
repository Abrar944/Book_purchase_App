# FROM node:16-alpine

# ENV PORT=3000

# WORKDIR /bookapp-react-js
# COPY . /bookapp-react-js
# RUN npm run build
# EXPOSE ${PORT}
# CMD ["npm", "start"]

FROM node:16-alpine
WORKDIR /bookapp-react-js
COPY . /bookapp-react-js
RUN npm run build
CMD ["npm", "start"]

FROM nginx:1.22.1-alpine
COPY --from=build-stage /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
