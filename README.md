# persisted_cache

Primary use is for SQLite examination. This allows for SELECT and other statements to be persisted and recalled as for queries into a SQLite database. It can also be used to store any collection of strings (up to 20) for recall and broadcast throug PersistedCubit.

## Install

```text
dependencies:
  persisted_cache:
    git:
      url: https://github.com/RAE-Health/persisted_cache.git
```

***- OR -***

```text
dependencies:
  persisted_cache:
    git:
      url: https://github.com/RAE-Health/persisted_cache.git
```

## Import

```dart
import 'package:persisted_cache/persisted_cache.dart';
```

## Usage

In *main.dart*

```dart
await PersistedHive.setup();
```

When a string is entered.

```dart
/// When 'Save' is tapped PersistedCache
emit(PersistedStateNewItem(newInput));
```

Since the PersistedCache is defined in the AppModule any other widget/element can subscribe and be notified when there is a new/(or previously stored) string is selected.

The widget itself:

```dart
PersistedWidet w = PersistedWidet({this.enableAutoCorrect = false});
```

## Final Note

Be kind to each other
