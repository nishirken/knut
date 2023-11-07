import 'package:flutter/material.dart';

final keys = (
  root: const Key('irregular-verbs-screen'),
  checkScreenButton: const Key('check-screen-button'),
  searchInput: const Key('search-input'),
  verbsInfoBlock: (String verb) => Key('irregular-verbs-info-block-$verb'),
);
