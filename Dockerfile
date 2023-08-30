FROM node:18

WORKDIR /app

# this commands comes from https://yarnpkg.com/getting-started/install

RUN corepack enable

RUN corepack prepare yarn@stable --activate

RUN yarn init -2

RUN yarn set version stable

RUN yarn add vue

# https://vitest.dev/guide/
RUN yarn add -D vitest happy-dom

# this commands comes from https://github.com/vuejs/test-utils
RUN yarn add @vue/test-utils@2.4.1 --dev

COPY example.test.ts .

CMD [ "yarn", "run", "vitest", "run", "--dom" ]
