# Auto stock server

## Environment
- ```ruby 2.1```
- ```rails 3.2.22.1```
- ```angular 1.2```

## Getting started - development
1. Clone this repository and checkout to dev/chloe
2. Move to chloe/auto_stock_server
3. Build docker image with ```$ docker build --build-arg NODE_ENV="production" -t chloe/ror-practice .```
4. Deploy and start the server with ```$ ./deploy.sh```
5. Point your browser to http://localhost:3000
