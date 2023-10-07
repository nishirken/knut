import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:namer_app/models/verb/verb.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnabledTenses extends ChangeNotifier {
  static String key = "enabled-tenses";
  final Map<Tense, bool> _fields = {};
  final SharedPreferences sharedPreferences;

  EnabledTenses({required this.sharedPreferences}) {
    if (sharedPreferences.getString(key) != null) {
      final map = Map.castFrom(jsonDecode(sharedPreferences.getString(key)!));
      for (final entry in map.entries) {
        final key = Tense.values.firstWhere(
          (enumValue) => enumValue.toString() == entry.key,
          orElse: () => throw const FormatException(),
        );
        _fields[key] = entry.value;
      }
    } else {
      for (var t in Tense.values) {
        _fields[t] = true;
      }
    }
  }

  void toggle(Tense tense, bool value) {
    _fields[tense] = value;
    _save();
    notifyListeners();
  }

  bool getValue(Tense tense) {
    return _fields[tense] ?? false;
  }

  int get length {
    return _fields.length;
  }

  void _save() {
    final Map<String, bool> strMap = {};
    for (final entry in _fields.entries) {
      strMap[entry.key.toString()] = entry.value;
    }
    final values = jsonEncode(strMap);

    sharedPreferences.setString(
      key,
      values,
    );
  }
}
