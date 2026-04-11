# ===== Сборка Flutter web =====
FROM ghcr.io/cirruslabs/flutter:3.32.8 AS builder

WORKDIR /app

COPY pubspec.yaml pubspec.lock ./
RUN flutter pub get

COPY . .

# .env нужен на этапе сборки (flutter_dotenv встраивает его в ассеты)
ARG API_URL
RUN echo "API_URL=${API_URL}" > .env

RUN flutter build web --release

# ===== Раздача статики через Nginx =====
FROM nginx:alpine AS prod

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build/web /usr/share/nginx/html

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]
