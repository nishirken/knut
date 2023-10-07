import 'package:flutter/material.dart';
import 'package:namer_app/models/verb/verb.dart';

class EnabledTenses extends ChangeNotifier {
  final Map<Tense, bool> _fields = {};

  EnabledTenses() {
    for (var t in Tense.values) {
      _fields[t] = true;
    }
  }

  void toggle(Tense tense, bool value) {
    _fields[tense] = value;
    notifyListeners();
  }

  bool getValue(Tense tense) {
    return _fields[tense] ?? false;
  }

  int get length {
    return _fields.length;
  }
}
