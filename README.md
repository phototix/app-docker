# PHP Docker Web App

Built something simple: A PHP web app that runs in a Docker container. Clone the repo, spin it up, and you're live.

## Prerequisites

You need just one thing:

- [Docker](https://www.docker.com/get-started) (because containers are the future)

## Setup

### 1. Clone the Repository

First, grab the code. It’s fast. Run this:

```bash
git clone https://github.com/phototix/app-docker.git
cd app-docker
```

### 2. Run the Docker Container

One command. That’s it. Run this to launch your app:

```bash
docker run -d -p 8080:80 --name my-webapp brandonccy1982/php-docker-app:latest
```

What happens here:
- `-d` runs it in the background.
- `-p 8080:80` maps your local port `8080` to the container’s `80`.
- `--name my-webapp` gives it a name.

### 3. Access the Application

Boom. Your app is running. Open your browser and go to:

```
http://localhost:8080
```

You should see: **"Hello, World!"**

## Managing the Docker Container

A few quick commands to keep things running smooth:

- **Stop the container:**
  ```bash
  docker stop my-webapp
  ```

- **Start the container:**
  ```bash
  docker start my-webapp
  ```

- **Remove the container:**
  ```bash
  docker rm my-webapp
  ```

That’s it. Clean, simple, fast. Go build.

