# Flask REST Project

This repository contains a minimal Flask-based REST API that follows along with the [Rest APIs with Flask tutorial](https://rest-apis-flask.teclado.com/). It demonstrates:

- A production-ready Docker setup (multi-stage, Alpine-based)  
- A development setup with hot-reloading via a separate Dockerfile and Docker Compose profiles  

---

## 🚀 Quick Start

### Prerequisites

- [Git](https://git-scm.com/)  
- [Docker](https://www.docker.com/get-started) (≥ 20.10)  
- [Docker Compose](https://docs.docker.com/compose/) (≥ 1.29)

---

### 1. Clone the repository

```bash
git clone https://github.com/TrulsElg/flask-rest-project.git
cd flask-rest-project
```

## 2. Build & Run in Production Mode

Utilises Docker Compose profiles to distinguish production (`prod`) vs. development (`dev`). The production stack includes only the core Flask application (no hot-reload, no bind mounts).

```bash
# Build and start only the "prod" services (Flask + any required services)
docker compose --profile prod up --build
```
(Optional) Use Make for shorter command syntax.
```bash
make prod
```

## 3. Build & Run in Development Mode (Hot-Reload)

When you’re actively developing, you’ll want Flask’s built-in reloader to restart the server on code changes. We achieve this with:

- A dedicated `Dockerfile.dev` (which installs dependencies into a virtualenv but does **not** copy source files at build time)  
- A Compose profile named `dev` that bind-mounts your local directory into `/app` and runs `flask run --reload`

```bash
# Build and start "dev" services (Flask + hot-reload)
docker compose --profile dev up --build
```
(Optional) Use Make for shorter command syntax.
```bash
make dev
```

This will use `Dockerfile.dev` under the hood.

Everything in your local project directory is mounted over `/app`, so any edits you make (e.g. to `app.py` or other modules) trigger an automatic Flask restart.
