# Zenith

## Author

| Roll No. | Name | GitHub username |
|---|---|---|
| 24ESKCS046 | Anirudh Jangid | anirudhjangid16 |

## About

Zenith is a college management website designed to manage and organize
college resources such as classrooms, laboratories, and auditoriums. It
provides a web-based interface to make campus resource reservations and
approvals convenient and accessible.

## Tech Stack

- **Frontend:** HTML5, CSS3, JavaScript
- **Web Server:** Nginx (Alpine Linux)
- **Containerization:** Docker, Docker Compose
- **Container Registry:** GitHub Packages (GHCR)
- **Orchestration:** Kubernetes
- **Monitoring:** Prometheus, Nginx Prometheus Exporter, Grafana
- **CI/CD:** GitHub Actions, Jenkins

## Live URL

[Open Zenith on GitHub Pages](https://skit-devops-2026.github.io/devops-24ESKCS046/)

- Website: https://skit-devops-2026.github.io/devops-24ESKCS046/
- Health Endpoint: https://skit-devops-2026.github.io/devops-24ESKCS046/health

## Running Locally

### Install dependencies

```bash
make install
```

### Run automated tests

```bash
make test
```

### Validate build

```bash
make build
```

## Docker

### Build the Docker image

```bash
make docker-build
# or
docker build -t ghcr.io/skit-devops-2026/devops-24eskcs046:latest .
```

### Run the Docker container

```bash
docker run --rm -p 8080:80 --name zenith-web ghcr.io/skit-devops-2026/devops-24eskcs046:latest
```

Open `http://localhost:8080` in your web browser.

### Published Image

The container image is automatically built and published to GitHub Container Registry on pushes to `main`:

`ghcr.io/skit-devops-2026/devops-24eskcs046:latest`

## Docker Compose

Start the full stack including the Zenith web service, Nginx Prometheus Exporter, Prometheus, and Grafana:

```bash
make docker-up
# or
docker compose up -d
```

### Local Endpoints

- Zenith Web App: `http://localhost:8080`
- Health Endpoint: `http://localhost:8080/health`
- Prometheus Server: `http://localhost:9090`
- Grafana Dashboard: `http://localhost:3000` (default login: admin / admin)

Stop the compose services:

```bash
docker compose down
```

## Kubernetes

Deploy Zenith to Kubernetes using the manifests under `k8s/`:

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

Verify the deployment and service:

```bash
kubectl get deployments
kubectl get pods -l app=zenith-web
kubectl get services zenith-web
```

The service is exposed as a NodePort on port 30080.

## Monitoring

Monitoring configurations are maintained under `monitoring/`:

- `monitoring/prometheus.yml`: Configured scrape jobs for Prometheus, Nginx exporter, and Zenith application.
- `monitoring/alerts.yml`: Alert definitions for service downtime.
- `monitoring/dashboard.json`: Exported Grafana dashboard tracking service status, active connections, HTTP throughput, and scrape metrics.

Evidence screenshots are documented under `docs/`.

## Health Check

- `GET /health` returns JSON response:
  ```json
  {"status":"ok","service":"zenith","commit":"<git-sha>"}
  ```

## CI/CD Pipeline

The GitHub Actions workflow (`.github/workflows/ci.yml`) runs on every push and pull request:
1. Executes repository hygiene checks (`scripts/hygiene.sh`).
2. Runs unit and integration test suites (`make test`).
3. Validates required milestone manifests (`make build`).
4. Builds and publishes the container image to GitHub Container Registry (`ghcr.io`).

The deployment workflow (`.github/workflows/pages.yml`) publishes the verified static site to GitHub Pages.

## Repository Structure

```text
.github/workflows/   GitHub Actions CI/CD workflows
docs/                Deployment and monitoring screenshots
frontend/            Static HTML, CSS, JavaScript web assets
k8s/                 Kubernetes Deployment and Service manifests
monitoring/          Prometheus configuration and Grafana dashboards
nginx/               Nginx configuration templates
scripts/             Hygiene and verification scripts
tests/               Automated test suites
Dockerfile           Nginx-based container image definition
docker-compose.yml   Multi-container orchestration definition
Makefile             Automation targets for install, test, build, run
Jenkinsfile          Declarative Jenkins build pipeline
```
