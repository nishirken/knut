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
  final Map<String, bool> _fieldsEnabled = {
    'Imperative mood': true,
    'Present simple': true,
    'Past continious': true,
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
      _formKey.currentState?.validate();
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
          name: '$title-singular-first',
          hintText: 'singular first',
          equalValues: verb?.singular.first,
        ),
        (
          name: '$title-singular-second',
          hintText: 'singular second',
          equalValues: verb?.singular.second,
        ),
        (
          name: '$title-singular-third',
          hintText: 'singular third',
          equalValues: verb?.singular.third,
        )
      ],
      [
        (
          name: '$title-plural-first',
          hintText: 'plural first',
          equalValues: verb?.plural.first,
        ),
        (
          name: '$title-plural-second',
          hintText: 'plural second',
          equalValues: verb?.plural.second,
        ),
        (
          name: '$title-plural-third',
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
              child: Container(
                width: 250,
                child: Column(children: [
                  Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: fields.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CheckboxListTile(
                              key: keys.inputsBlockCheckbox(fields[index].key),
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
                    if (_fieldsEnabled['Past continious'] == true)
                      _inflectedVerb('Past continious', _verb?.pastContinious),
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
