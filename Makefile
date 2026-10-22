.PHONY: install test build run docker-build docker-up

install:
	@echo "No external dependencies required"

test:
	node --test tests/script.test.js tests/frontend-files.test.js tests/manifests.test.js

build:
	@echo "Validating static website and M5-M7 files..."
	node -e "const fs = require('fs'); ['frontend/index.html', 'frontend/booking.html', 'frontend/admin.html', 'frontend/script.js', 'frontend/style.css', 'Dockerfile', 'docker-compose.yml', 'k8s/deployment.yaml', 'k8s/service.yaml', 'monitoring/prometheus.yml', 'monitoring/dashboard.json'].forEach(f => { if (!fs.existsSync(f)) throw new Error('Missing ' + f); });"
	@echo "Build validation passed"

run:
	@echo "Open frontend/index.html in a browser"

docker-build:
	docker build -t ghcr.io/skit-devops-2026/devops-24eskcs046:latest .

docker-up:
	docker compose up --build
