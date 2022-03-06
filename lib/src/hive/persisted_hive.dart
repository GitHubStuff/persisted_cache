import 'dart:convert';

import 'package:code_generation_annotation/code_generation_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'persisted_hive.g.dart';

const int _listSize = 20;

@HiveJsonSerialExtender(className: 'PersistedHive', key: 'PersistedHive')
@JsonSerializable()
class PersistedHive {
  List<String> cachedStrings = [];
  int _index = -1;
  final String defaultValue;
  PersistedHive({this.defaultValue = ''});

  factory PersistedHive.fromJson(Map<String, dynamic> json) => _$PersistedHiveFromJson(json);
  Map<String, dynamic> toJson() => _$PersistedHiveToJson(this);

  //! Put in main()
  static Future<void> setup() => _$setup();

  static PersistedHive from({required String string}) => _$fromString(string);
  static PersistedHive? reload() => _$reload();

  void close() => _$close();
  void delete() => _$delete();
  void save() => _$save();

  /// List Helpers

  String get current => (_index == -1) ? defaultValue : cachedStrings[_index];

  bool get hasPrevious => _index != -1;
  bool get hasNext => _index != cachedStrings.length - 1;

  String recallNext() {
    if (++_index == cachedStrings.length) _index = cachedStrings.length - 1;
    return (_index == -1) ? defaultValue : cachedStrings[_index];
  }

  String recallPrevious() => (_index == -1 || --_index == -1) ? defaultValue : cachedStrings[_index];

  void update(String string) {
    cachedStrings.removeWhere((element) => element == string);
    cachedStrings.insert(0, string);
    while (cachedStrings.length > _listSize) {
      cachedStrings.removeLast();
    }
    save();
  }
}
