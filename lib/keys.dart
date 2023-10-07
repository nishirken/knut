import 'package:flutter/material.dart';
import 'package:namer_app/models/verb/verb.dart';

final keys = (
  drawer: const Key('drawer'),
  submitButton: const Key('submit button'),
  verbInput: (String name) => Key('input-$name'),
  inputsBlock: (String title) => Key("inputs-$title"),
  inputsBlockCheckbox: (Tense tense) => Key('checkbox-$tense'),
  supportedVerbInput: const Key('supported-verb-input'),
  supportedVerbButton: const Key('supported-verb-button'),
  supportedVerbIcon: (IconData icon) =>
      Key('supported-verb-icon-${icon.toString()}'),
);
