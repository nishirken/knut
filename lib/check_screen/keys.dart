import 'package:flutter/material.dart';
import 'package:namer_app/models/verb/verb.dart';

final keys = (
  root: const Key('check-screen'),
  irregularVerbsButton: const Key('irregular-verbs-button'),
  submitButton: const Key('submit button'),
  verbInput: (String name) => Key('input-$name'),
  inputsBlock: (String title) => Key("inputs-$title"),
  inputsBlockCheckbox: (Tense tense) => Key('checkbox-$tense'),
);
