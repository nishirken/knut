import 'package:flutter/material.dart';

final keys = (
  submitButton: const Key('submit button'),
  verbInput: (String name) => Key('input-$name'),
  inputsBlock: (String title) => Key("inputs-$title"),
  inputsBlockCheckbox: (String title) => Key('checkbox-$title'),
  supportedVerbInput: const Key('supported-verb-input'),
  supportedVerbButton: const Key('supported-verb-button'),
  supportedVerbIcon: (IconData icon) =>
      Key('supported-verb-icon-${icon.toString()}'),
);
