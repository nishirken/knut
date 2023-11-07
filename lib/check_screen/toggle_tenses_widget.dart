import 'package:flutter/material.dart';
import 'package:namer_app/check_screen/keys.dart';
import 'package:namer_app/const.dart';
import 'package:namer_app/models/enabled_tenses.dart';
import 'package:namer_app/models/verb/verb.dart';
import 'package:provider/provider.dart';

class ToggleTensesWidget extends StatelessWidget {
  const ToggleTensesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<EnabledTenses>(
      builder: (context, tenses, child) => ListView.builder(
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
          }),
    );
  }
}
