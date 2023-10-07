import 'package:flutter/material.dart';
import 'package:namer_app/const.dart';
import 'package:namer_app/models/enabled_tenses.dart';
import 'package:namer_app/models/verb/verb.dart';
import 'package:namer_app/keys.dart';
import 'package:namer_app/supported_verbs_widget.dart';
import 'package:provider/provider.dart';

class TensesListWidget extends StatelessWidget {
  const TensesListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<EnabledTenses>(
      builder: (context, tenses, child) => Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              itemCount: tenses.length - 1,
              itemBuilder: (BuildContext context, int index) {
                final tense = Tense.values[index];

                if (tense == Tense.infinitive) {
                  return const SizedBox.shrink();
                }

                return CheckboxListTile(
                    key: keys.inputsBlockCheckbox(tense),
                    title: Text(titles[tense]!),
                    value: tenses.getValue(tense),
                    onChanged: (changed) {
                      tenses.toggle(tense, changed ?? false);
                    });
              })),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: keys.drawer,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          const TensesListWidget(),
          const SizedBox(height: 16),
          SupportedVerbsWidget(),
        ]),
      ),
    );
  }
}
