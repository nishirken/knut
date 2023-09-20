import 'package:flutter/material.dart';
import 'package:namer_app/data/irregular_verbs.dart';
import 'package:namer_app/data/verb.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:namer_app/data/verbs.dart';
import 'package:namer_app/inputs_block_widget.dart';
import 'package:namer_app/supported_verbs_widget.dart';

void main() => runApp(const FormExampleApp());

class FormExampleApp extends StatelessWidget {
  const FormExampleApp({super.key});

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
  final Map<String, bool> _fieldsEnabled = {
    'Imperative mood': true,
    'Present simple': true,
  };

  void _submit() {
    Verb? verb;
    try {
      verb = getVerb(_formKey.currentState?.fields['infinitive']?.value ?? '');
    } catch (e) {
      verb = null;
    }
    setState(() {
      _verb = verb;
    });
    // validate after state udpate
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _formKey.currentState
          ?.validate(focusOnInvalid: true, autoScrollWhenFocusOnInvalid: true);
    });
  }

  String? _verbValidator(String? value) {
    try {
      if (value != null) {
        getVerb(value);
      }
    } catch (e) {
      return "Invalid value";
    }
    return null;
  }

  bool get _validate {
    return _verb != null;
  }

  Widget _inflectedVerb(String title, InflectedVerb? verb) {
    return InputsBlockWidget(validate: _validate, title: title, fields: (
      [
        (
          name: '$title-${verb?.singular.first ?? ''}-first',
          hintText: 'singular first',
          equalValues: verb?.singular.first,
        ),
        (
          name: '$title-${verb?.singular.second ?? ''}-second',
          hintText: 'singular second',
          equalValues: verb?.singular.second,
        ),
        (
          name: '$title-${verb?.singular.third ?? ''}-third',
          hintText: 'singular third',
          equalValues: verb?.singular.third,
        )
      ],
      [
        (
          name: '$title-${verb?.plural.first ?? ''}-first',
          hintText: 'plural first',
          equalValues: verb?.plural.first,
        ),
        (
          name: '$title-${verb?.plural.second ?? ''}-second',
          hintText: 'plural second',
          equalValues: verb?.plural.second,
        ),
        (
          name: '$title-${verb?.plural.third ?? ''}-third',
          hintText: 'plural third',
          equalValues: verb?.plural.third,
        )
      ],
    ));
  }

  Irregular get _irregularVerbs {
    return IrregularVerbsCollection(infinitive: '', stamp: '').collection;
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
              child: Container(
                width: 250,
                child: Column(children: [
                  Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: fields.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CheckboxListTile(
                              title: Text(fields[index].key),
                              value: fields[index].value,
                              onChanged: (changed) {
                                setState(() {
                                  _fieldsEnabled[fields[index].key] =
                                      changed ?? fields[index].value;
                                });
                              });
                        }),
                  ),
                  SupportedVerbsWidget(irregularVerbs: _irregularVerbs),
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
                        validator: _verbValidator,
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
                        title: 'Infinitive'),
                    if (_fieldsEnabled['Imperative mood'] == true)
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
                    if (_fieldsEnabled['Present simple'] == true)
                      _inflectedVerb('Present simple', _verb?.present),
                    Padding(
                      padding: _verticalPadding,
                      child: ElevatedButton(
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
