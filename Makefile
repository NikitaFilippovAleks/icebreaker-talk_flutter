generate:
	flutter pub get
	flutter pub run build_runner build --delete-conflicting-outputs
	dart format lib test

clean:
	flutter clean
	find . -name "*.freezed.dart" -type f -delete
	find . -name "*.g.dart" -type f -delete
	find . -name "*.mocks.dart" -type f -delete
	find . -name "*.config.dart" -type f -delete
	find . -name "*.chopper.dart" -type f -delete
	find . -name "*.inject.dart" -type f -delete
	find . -name "*.inject.summary" -type f -delete
	find . -name "*.inject.summary.json" -type f -delete
	find . -name "*.inject.summary.yaml" -type f -delete
	find . -name "*.inject.summary.yml" -type f -delete

web-deps:
	@DRIFT_VERSION=$$(grep -A6 '  drift:' pubspec.lock | grep 'version:' | head -1 | tr -d ' "' | cut -d: -f2) && \
	SQLITE3_VERSION=$$(grep -A6 '  sqlite3:' pubspec.lock | grep 'version:' | head -1 | tr -d ' "' | cut -d: -f2) && \
	echo "Скачиваю drift_worker.js (drift $$DRIFT_VERSION) и sqlite3.wasm (sqlite3 $$SQLITE3_VERSION)..." && \
	curl -fL -o web/drift_worker.js "https://github.com/simolus3/drift/releases/download/drift-$$DRIFT_VERSION/drift_worker.js" && \
	curl -fL -o web/sqlite3.wasm "https://github.com/simolus3/sqlite3.dart/releases/download/sqlite3-$$SQLITE3_VERSION/sqlite3.wasm" && \
	echo "Готово."

docker-run:
	docker compose -f docker-compose.local.yml up --build
