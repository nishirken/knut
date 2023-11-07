import 'package:flutter/material.dart';
import 'package:namer_app/const.dart';
import 'package:namer_app/models/verb/verb.dart';

class VerbTenseWidget extends StatelessWidget {
  final String tenseName;
  final ({List<String> singular, List<String> plural}) forms;

  const VerbTenseWidget({
    super.key,
    required this.tenseName,
    required this.forms,
  });

  Widget _column(List<String> tenses) {
    return Expanded(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: tenses
              .map((v) =>
                  SelectableText(v, style: const TextStyle(fontSize: 16)))
              .toList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(tenseName, style: const TextStyle(fontSize: 16)),
        ),
        const SizedBox(height: 16),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _column(forms.singular),
          _column(forms.plural),
        ])
      ]),
    );
  }
}

class VerbInfoWidget extends StatelessWidget {
  final Verb verb;

  const VerbInfoWidget({
    super.key,
    required this.verb,
  });

  List<String> _flatten(InflectedFacialTense tense) {
    return [...tense.first, ...tense.second, ...tense.third];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 48),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SelectableText(verb.infinitive,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        const SizedBox(height: 8),
        if (verb.imperativeMood is IrregularImperativeMood)
          VerbTenseWidget(tenseName: titles[Tense.imperativeMood]!, forms: (
            singular: verb.imperativeMood.singular,
            plural: verb.imperativeMood.plural
          )),
        if (verb.present is IrregularInflectedTense)
          VerbTenseWidget(tenseName: titles[Tense.present]!, forms: (
            singular: _flatten(verb.present.singular),
            plural: _flatten(verb.present.plural)
          )),
        if (verb.presentPerfect is IrregularInflectedTense)
          VerbTenseWidget(tenseName: titles[Tense.presentPerfect]!, forms: (
            singular: _flatten(verb.presentPerfect.singular),
            plural: _flatten(verb.presentPerfect.plural)
          )),
        if (verb.pastSimple is IrregularInflectedTense)
          VerbTenseWidget(tenseName: titles[Tense.pastSimple]!, forms: (
            singular: _flatten(verb.pastSimple.singular),
            plural: _flatten(verb.pastSimple.plural)
          )),
        if (verb.pastContinious is IrregularInflectedTense)
          VerbTenseWidget(tenseName: titles[Tense.pastContinious]!, forms: (
            singular: _flatten(verb.pastContinious.singular),
            plural: _flatten(verb.pastContinious.plural)
          )),
        if (verb.pastPerfect is IrregularInflectedTense)
          VerbTenseWidget(tenseName: titles[Tense.pastPerfect]!, forms: (
            singular: _flatten(verb.pastPerfect.singular),
            plural: _flatten(verb.pastPerfect.plural)
          )),
        if (verb.futureSimple is IrregularInflectedTense)
          VerbTenseWidget(tenseName: titles[Tense.futureSimple]!, forms: (
            singular: _flatten(verb.futureSimple.singular),
            plural: _flatten(verb.futureSimple.plural)
          )),
        if (verb.futureSimpleNegative is IrregularInflectedTense)
          VerbTenseWidget(
              tenseName: titles[Tense.futureSimpleNegative]!,
              forms: (
                singular: _flatten(verb.futureSimpleNegative.singular),
                plural: _flatten(verb.futureSimpleNegative.plural)
              )),
        if (verb.goingTo is IrregularInflectedTense)
          VerbTenseWidget(tenseName: titles[Tense.goingTo]!, forms: (
            singular: _flatten(verb.goingTo.singular),
            plural: _flatten(verb.goingTo.plural)
          ))
      ]),
    );
  }
}
