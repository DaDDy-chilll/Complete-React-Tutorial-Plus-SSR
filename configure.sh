#!/bin/bash

# This script will allow the SSR modifications to be performed quickly; used for debugging i.e. trying different branches etc.
# cd ~/Complete-React-Tutorial-Plus-SSR
# git checkout lesson-xx
# fetch this file
# curl "https://raw.githubusercontent.com/second-state/Complete-React-Tutorial-Plus-SSR/lesson-32/configure.sh" -o configure.sh
# Make the file executable
# sudo chmod a+x configure.sh
# Run the file
# ./configure.sh

URL1="https://raw.githubusercontent.com/second-state/Complete-React-Tutorial-Plus-SSR/lesson-32/dojo-blog/src/index.js"
curl $URL1 -o dojo-blog/src/index.js

mkdir -p dojo-blog/server
URL2="https://raw.githubusercontent.com/second-state/Complete-React-Tutorial-Plus-SSR/lesson-32/dojo-blog/server/index.js"
curl $URL2 -o dojo-blog/server/index.js

URL3="https://raw.githubusercontent.com/second-state/Complete-React-Tutorial-Plus-SSR/lesson-32/dojo-blog/.babelrc.json"
curl $URL3 -o dojo-blog/.babelrc.json

URL4="https://raw.githubusercontent.com/second-state/Complete-React-Tutorial-Plus-SSR/lesson-32/dojo-blog/webpack.server.js"
curl $URL4 -o dojo-blog/webpack.server.js

URL5="https://raw.githubusercontent.com/second-state/Complete-React-Tutorial-Plus-SSR/lesson-32/dojo-blog/package.json"
curl $URL5 -o dojo-blog/package.json

URL6="https://raw.githubusercontent.com/second-state/Complete-React-Tutorial-Plus-SSR/lesson-32/dojo-blog/rollup.config.js"
curl $URL6 -o dojo-blog/rollup.config.js

cd dojo-blog
rm -rf node_modules
rm package-lock.json
npm i g react-scripts
npm install
npm run build
npx browserslist@latest --update-db
npm run dev:build-server
npm run dev:start-server

# Visit the app at port 8002
