FROM node:9-alpine AS pkginstall

WORKDIR /app

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN npm install git+https://git@github.com/2J/ghost-github.git



FROM ghost:1-alpine

WORKDIR /var/lib/ghost

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN npm install git+https://git@github.com/2J/ghost-github.git

RUN mkdir -p /var/lib/ghost/content/adapters/storage/ghost-github
RUN mkdir -p current/core/server/adapters/storage/ghost-github

COPY --from=pkginstall /app/node_modules/ghost-github current/core/server/adapters/storage/ghost-github
COPY --from=pkginstall /app/node_modules/ghost-github /var/lib/ghost/content/adapters/storage/ghost-github

ENV server__host 0.0.0.0

CMD ["node", "current/index.js"]
