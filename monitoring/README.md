# Zenith Monitoring Setup

This directory contains the Prometheus and Grafana monitoring configuration for Zenith.

## Components

- **`prometheus.yml`**: Scrapes metrics from Prometheus itself, the Nginx exporter (`nginx-exporter:9113`), and the Zenith web application.
- **`alerts.yml`**: Contains alerting rules for service availability.
- **`dashboard.json`**: Pre-built Grafana dashboard visualizing service status, request rates, active connections, and scrape duration.

## Running Locally

Start the full stack with monitoring:

```bash
docker compose up -d
```

Access endpoints:
- Zenith Web: http://localhost:8080
- Zenith Health: http://localhost:8080/health
- Prometheus: http://localhost:9090
- Grafana: http://localhost:3000 (credentials: admin / admin)
