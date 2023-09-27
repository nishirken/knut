import 'package:flutter/material.dart';
import 'package:namer_app/data/verb.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:namer_app/data/verbs.dart';
import 'package:namer_app/inputs_block_widget.dart';
import 'package:namer_app/keys.dart';
import 'package:namer_app/supported_verbs_widget.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

void main() => runApp(const KnutApp());

class KnutApp extends StatelessWidget {
  const KnutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: VerbsForm(),
      ),
    );
  }
}

class VerbsForm extends StatefulWidget {
  const VerbsForm({super.key});

  @override
  State<VerbsForm> createState() => _FormExampleState();
}

class _FormExampleState extends State<VerbsForm> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final _verticalPadding = const EdgeInsets.symmetric(vertical: 16.0);
  Verb? _verb;
  final Map<Tense, bool> _fieldsEnabled = {
    Tense.imperative: true,
    Tense.present: true,
    Tense.pastContinious: true,
    Tense.pastPerfect: true,
    Tense.presentPerfect: true,
    Tense.futureSimple: true,
    Tense.futureSimpleNegative: true,
    Tense.goingTo: true,
  };
  final Map<Tense, String> titles = {
    Tense.infinitive: 'Infinitive',
    Tense.imperative: 'Imperative mood',
    Tense.present: 'Present',
    Tense.presentPerfect: 'Present perfect',
    Tense.pastContinious: 'Past continious',
    Tense.pastPerfect: 'Past perfect',
    Tense.futureSimple: 'Future simple',
    Tense.futureSimpleNegative: 'Future simple negative',
    Tense.goingTo: 'Going to',
  };

  void _submit() {
    Verb? verb;
    try {
      verb = mkVerb(_formKey.currentState?.fields['infinitive']?.value ?? '');
    } catch (e) {
      verb = null;
    }
    setState(() {
      _verb = verb;
    });
    // validate after state udpate
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _formKey.currentState?.validate();
    });
  }

  String? _verbValidator(String? value) {
    try {
      if (value != null) {
        mkVerb(value);
      }
    } catch (e) {
      return "Invalid value";
    }
    return null;
  }

  bool get _validate {
    return _verb != null;
  }

  Widget _inflectedVerb(Tense tense, InflectedVerb? verb) {
    return InputsBlockWidget(
        validate: _validate,
        title: titles[tense]!,
        fields: (
          [
            (
              name: '$tense-singular-first',
              hintText: 'singular first',
              equalValues: verb?.singular.first,
            ),
            (
              name: '$tense-singular-second',
              hintText: 'singular second',
              equalValues: verb?.singular.second,
            ),
            (
              name: '$tense-singular-third',
              hintText: 'singular third',
              equalValues: verb?.singular.third,
            )
          ],
          [
            (
              name: '$tense-plural-first',
              hintText: 'plural first',
              equalValues: verb?.plural.first,
            ),
            (
              name: '$tense-plural-second',
              hintText: 'plural second',
              equalValues: verb?.plural.second,
            ),
            (
              name: '$tense-plural-third',
              hintText: 'plural third',
              equalValues: verb?.plural.third,
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final fields = _fieldsEnabled.entries.toList();
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: SizedBox(
                width: 250,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: fields.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CheckboxListTile(
                                  key: keys
                                      .inputsBlockCheckbox(fields[index].key),
                                  title: Text(titles[fields[index].key]!),
                                  value: fields[index].value,
                                  onChanged: (changed) {
                                    setState(() {
                                      _fieldsEnabled[fields[index].key] =
                                          changed ?? fields[index].value;
                                    });
                                  });
                            }),
                      ),
                      SupportedVerbsWidget(),
                    ]),
              ),
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 800),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputsBlockWidget(
                        validate: true,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          _verbValidator,
                        ]),
                        fields: (
                          [
                            (
                              name: 'infinitive',
                              hintText: 'Enter the infinitive',
                              equalValues: null,
                            )
                          ],
                          []
                        ),
                        title: titles[Tense.infinitive]!),
                    if (_fieldsEnabled[Tense.imperative] == true)
                      InputsBlockWidget(
                          validate: _validate,
                          fields: (
                            [
                              (
                                name: 'imperative-singular',
                                hintText: 'singular',
                                equalValues: _verb?.imperativeMood.singular,
                              )
                            ],
                            [
                              (
                                name: 'imperative-plural',
                                hintText: 'plural',
                                equalValues: _verb?.imperativeMood.plural,
                              )
                            ]
                          ),
                          title: 'Imperative mood'),
                    if (_fieldsEnabled[Tense.present] == true)
                      _inflectedVerb(Tense.present, _verb?.present),
                    if (_fieldsEnabled[Tense.pastSimple] == true)
                      _inflectedVerb(Tense.pastSimple, _verb?.pastSimple),
                    if (_fieldsEnabled[Tense.pastContinious] == true)
                      _inflectedVerb(
                          Tense.pastContinious, _verb?.pastContinious),
                    if (_fieldsEnabled[Tense.presentPerfect] == true)
                      _inflectedVerb(
                          Tense.presentPerfect, _verb?.presentPerfect),
                    if (_fieldsEnabled[Tense.pastPerfect] == true)
                      _inflectedVerb(Tense.pastPerfect, _verb?.pastPerfect),
                    if (_fieldsEnabled[Tense.futureSimple] == true)
                      _inflectedVerb(Tense.futureSimple, _verb?.futureSimple),
                    if (_fieldsEnabled[Tense.futureSimpleNegative] == true)
                      _inflectedVerb(Tense.futureSimpleNegative,
                          _verb?.futureSimpleNegative),
                    if (_fieldsEnabled[Tense.goingTo] == true)
                      _inflectedVerb(Tense.goingTo, _verb?.goingTo),
                    Padding(
                      padding: _verticalPadding,
                      child: ElevatedButton(
                        key: keys.submitButton,
                        onPressed: _submit,
                        child: const Text('Check'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
