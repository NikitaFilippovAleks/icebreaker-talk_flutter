# Технологический стек

> **Правило самообновления:** Обновляйте этот файл при добавлении, удалении или обновлении зависимостей в `pubspec.yaml`.

## Основа
- **Flutter** ^3.8.1, Material Design
- **Dart** (null-safe)

## Управление состоянием
- `flutter_bloc` ^9.1.1 — паттерн BLoC

## Модели и сериализация
- `freezed` / `freezed_annotation` 3.x — иммутабельные модели, union-типы
- `json_serializable` / `json_annotation` — JSON-(де)сериализация

## Внедрение зависимостей
- `get_it` ^8.2.0 — сервис-локатор
- `injectable` / `injectable_generator` ^2.x — кодогенерация для DI

## Сеть
- `dio` ^5.9.0 — HTTP-клиент
- `retrofit` / `retrofit_generator` ^4.7.1 / ^10.0.2 — типобезопасные API-клиенты
- `talker_dio_logger` ^5.0.0 — логирование запросов/ответов

## Локальная база данных
- `drift` ^2.28.1 + `drift_flutter` — типобезопасная ORM для SQLite

## Навигация
- `go_router` ^16.2.0 + `go_router_builder` — типизированная маршрутизация

## UI
- `flutter_screenutil` ^5.9.3 — адаптивные размеры
- `flutter_svg` ^2.2.0 — рендеринг SVG
- `flutter_card_swiper` ^7.0.2 — свайп карточек
- `custom_refresh_indicator` ^4.0.1 — pull-to-refresh

## Темизация
- `theme_tailor` / `theme_tailor_annotation` ^3.1.0 — генерация расширений темы

## Интернационализация
- `slang` / `slang_flutter` ^4.8.x — i18n с кодогенерацией

## Окружение
- `flutter_dotenv` ^6.0.0 — загрузка .env-файлов

## Логирование
- `talker_flutter` ^5.0.0 — структурированное логирование с UI-оверлеем

## Кодогенерация
- `build_runner` ^2.6.0 — оркестрирует все генераторы кода
- `flutter_gen_runner` ^5.11.0 — типобезопасные ссылки на ассеты

## Линтинг
- `flutter_lints` ^5.0.0 — базовые правила линтинга (расширены 160+ кастомными правилами в `analysis_options.yaml`)
