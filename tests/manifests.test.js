const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const rootDir = path.join(__dirname, '..');

test('Dockerfile exists', () => {
  assert.equal(fs.existsSync(path.join(rootDir, 'Dockerfile')), true);
});

test('docker-compose.yml exists', () => {
  assert.equal(fs.existsSync(path.join(rootDir, 'docker-compose.yml')), true);
});

test('Kubernetes deployment manifest exists', () => {
  assert.equal(fs.existsSync(path.join(rootDir, 'k8s', 'deployment.yaml')), true);
});

test('Kubernetes service manifest exists', () => {
  assert.equal(fs.existsSync(path.join(rootDir, 'k8s', 'service.yaml')), true);
});

test('Prometheus config exists under monitoring/', () => {
  assert.equal(fs.existsSync(path.join(rootDir, 'monitoring', 'prometheus.yml')), true);
});

test('Monitoring dashboard exists under monitoring/', () => {
  assert.equal(fs.existsSync(path.join(rootDir, 'monitoring', 'dashboard.json')), true);
});

test('Deployment screenshot exists under docs/', () => {
  assert.equal(
    fs.existsSync(path.join(rootDir, 'docs', 'deployment.png')) ||
    fs.existsSync(path.join(rootDir, 'docs', 'deployment-screenshot.png')),
    true
  );
});
