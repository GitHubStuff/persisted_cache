import 'dart:convert';

import 'package:code_generation_annotation/code_generation_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'persisted_hive.g.dart';

@HiveJsonSerialExtender(className: 'PersistedHive', key: 'PersistedHive')
@JsonSerializable()
class PersistedHive {
  List<String> cachedStrings = [];
  PersistedHive();

  factory PersistedHive.fromJson(Map<String, dynamic> json) => _$PersistedHiveFromJson(json);
  Map<String, dynamic> toJson() => _$PersistedHiveToJson(this);
}
