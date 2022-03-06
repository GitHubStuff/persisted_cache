# persisted_cache

Primary use is for SQLite examination. This allows for SELECT and other statements to be persisted and recalled as for queries into a SQLite database. It can also be used to store any collection of strings (up to 20) for recall and broadcast throug PersistedCubit.

## Install

```text
dependencies:
  persisted_cache:
    git:
      url: https://github.com/GitHubStuff/persisted_cache.git
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

In *app_module.dart*

```dart
Bind.factory((i) => PersistedCubit()),

/// When '
```

The widget itself:

```dart
PersistedWidet w = PersistedWidet({this.enableAutoCorrect = false});
```

## Final Note

Be kind to each other
