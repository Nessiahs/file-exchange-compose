# file-exchange-compose

This is an easy way to host the file exchange project in a docker setup.
To do this, the host must have installed the following packages:

- docker
- docker-compose
- git
- build-essential for make support

### Provides

- NGINX as SSL termination
- NGINX to serve frontend
- Node.js to serve the Api
- Node.js to compile the frontend

## Installation

Install my-project with npm

```bash
  git clone git@github.com:Nessiahs/file-exchange-compose.git
  cd file-exchange-compose
  make install
  cp .env.example > .env
```

Edit the `.env`

```
NGINX_BODY_SIZE=500M
NGINX_SERVER_NAME=file-exchange.example.com
NGINX_CERTIFICATE_PATH=path_to_fullchaim.pem
NGINX_CERTIFICATE_KEY_PATH=path_to_privatekey.pem

```

First you need to compile the api and gui

```bash
make first

```

This command starts the container and compiles the api and gui and all works. For more [commands](./Makefile)
