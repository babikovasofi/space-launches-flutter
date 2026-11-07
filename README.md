# Космические запуски

## Предметная область

Приложение показывает каталог космических запусков. У каждого запуска есть название, дата, статус, ракета и миссия с орбитой. Запуск проводит космическое агентство и выполняет со стартовой площадки, поэтому с экрана запуска можно перейти к агентству и к площадке.

Данные загружаются из API [Launch Library 2](https://lldev.thespacedevs.com/2.2.0/) — зеркала для разработки, без ограничения на число запросов.

## Запуск

Зависимости:

```bash
flutter pub get
```

Браузер:

```bash
flutter run -d chrome
```

macOS:

```bash
flutter run -d macos
```

Android (идентификатор устройства показывает `flutter devices`):

```bash
flutter run -d <id>
```

Любой таргет на второй локали:

```bash
flutter run -d chrome --dart-define=LOCALE=en
```

Проверка ключей локализации:

```bash
dart run tool/check_arb.dart
```

Генерация DTO после правки файлов в `lib/features/launch/data/dto/`:

```bash
dart run build_runner build --delete-conflicting-outputs
```
