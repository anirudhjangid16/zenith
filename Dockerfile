FROM nginx:1.28-alpine

ARG GIT_COMMIT=local
ENV APP_COMMIT=${GIT_COMMIT}
ENV NGINX_ENVSUBST_FILTER=^(APP_COMMIT)$

COPY nginx/default.conf.template /etc/nginx/templates/default.conf.template
COPY frontend/ /usr/share/nginx/html/

RUN printf '{"status":"ok","service":"zenith","commit":"%s"}\n' "${GIT_COMMIT}" > /usr/share/nginx/html/health

EXPOSE 80 8081

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q -O /dev/null http://127.0.0.1/health || exit 1
