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
