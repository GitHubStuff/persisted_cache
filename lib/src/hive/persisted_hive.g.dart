// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persisted_hive.dart';

// **************************************************************************
// HiveGenerator
// **************************************************************************

// Extending features on PersistedHive to persist using Hive
/* NOTE: Cut/Paste for main file....
  //! Put in main()
  static Future<void> setup() => _$setup();

  static PersistedHive from({required String string}) => _$fromString(string);
  static PersistedHive? reload() => _$reload();

  void close() => _$close();
  void delete() => _$delete();
  void save() => _$save();
*/

const _boxName = 'com.shared.hive.data.store.PersistedHive';
const _key = 'PersistedHive';
Box? _box;
bool get _$setupComplete => (_box != null);

Future<void> _$setup() async {
  if (_$setupComplete) return;
  try {
    await Hive.initFlutter();
    _box = await Hive.openBox<String>(_boxName);
  } on NullThrownError {
  } on MissingPluginException {
  } catch (e) {
    throw FlutterError(e.toString());
  }
}

PersistedHive _$fromString(String string) =>
    PersistedHive.fromJson(jsonDecode(string));

PersistedHive? _$reload() {
  if (!_$setupComplete) throw FlutterError("Not setup");
  String? storedValue = _box?.get(_key);
  if (storedValue == null) return null;
  Map<String, dynamic> map = jsonDecode(storedValue);
  return PersistedHive.fromJson(map);
}

extension PersistedHiveWithHive on PersistedHive {
  void _$save() => (_$setupComplete)
      ? _box?.put(_key, jsonEncode(this))
      : throw FlutterError("Not setup");

  void _$close() =>
      (_$setupComplete) ? _box?.close() : throw FlutterError("Not setup");

  void _$delete() =>
      (_$setupComplete) ? _box?.delete(_key) : throw FlutterError("Not setup");
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersistedHive _$PersistedHiveFromJson(Map<String, dynamic> json) =>
    PersistedHive(
      defaultValue: json['defaultValue'] as String? ?? '',
    )..cachedStrings = (json['cachedStrings'] as List<dynamic>)
        .map((e) => e as String)
        .toList();

Map<String, dynamic> _$PersistedHiveToJson(PersistedHive instance) =>
    <String, dynamic>{
      'cachedStrings': instance.cachedStrings,
      'defaultValue': instance.defaultValue,
    };
