import 'package:flutter/material.dart';
import 'package:namer_app/const.dart';
import 'package:namer_app/models/enabled_tenses.dart';
import 'package:namer_app/models/verb/verb.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:namer_app/models/verb/verbs.dart';
import 'package:namer_app/inputs_block_widget.dart';
import 'package:namer_app/keys.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import './drawer.dart';

void main() => runApp(appWithProvider());

MultiProvider appWithProvider([Key? scaffoldKey]) {
  return MultiProvider(
    providers: [ChangeNotifierProvider(create: (c) => EnabledTenses())],
    child: KnutApp(scaffoldKey: scaffoldKey),
  );
}

class KnutApp extends StatelessWidget {
  final Key? scaffoldKey;

  const KnutApp({this.scaffoldKey, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(title: const Text("Hello")),
        body: const VerbsForm(),
        drawer: const AppDrawer(),
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
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<EnabledTenses>(
          builder: (context, tenses, child) => SingleChildScrollView(
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
                if (tenses.getValue(Tense.imperative))
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
                if (tenses.getValue(Tense.present))
                  _inflectedVerb(Tense.present, _verb?.present),
                if (tenses.getValue(Tense.pastSimple))
                  _inflectedVerb(Tense.pastSimple, _verb?.pastSimple),
                if (tenses.getValue(Tense.pastContinious))
                  _inflectedVerb(Tense.pastContinious, _verb?.pastContinious),
                if (tenses.getValue(Tense.presentPerfect))
                  _inflectedVerb(Tense.presentPerfect, _verb?.presentPerfect),
                if (tenses.getValue(Tense.pastPerfect))
                  _inflectedVerb(Tense.pastPerfect, _verb?.pastPerfect),
                if (tenses.getValue(Tense.futureSimple))
                  _inflectedVerb(Tense.futureSimple, _verb?.futureSimple),
                if (tenses.getValue(Tense.futureSimpleNegative))
                  _inflectedVerb(
                      Tense.futureSimpleNegative, _verb?.futureSimpleNegative),
                if (tenses.getValue(Tense.goingTo))
                  _inflectedVerb(Tense.goingTo, _verb?.goingTo),
                if (tenses.getValue(Tense.effectiveParticiple))
                  InputsBlockWidget(
                      validate: _verb != null,
                      fields: (
                        [
                          (
                            name: 'effective-participle',
                            hintText: 'Enter effective participle',
                            equalValues: _verb?.effectiveParticiple != null
                                ? [_verb!.effectiveParticiple]
                                : null,
                          )
                        ],
                        [],
                      ),
                      title: titles[Tense.effectiveParticiple]!),
                if (tenses.getValue(Tense.subjectiveParticiple))
                  InputsBlockWidget(
                      validate: _verb != null,
                      fields: (
                        [
                          (
                            name: 'subjective-participle',
                            hintText: 'Enter subjective participle',
                            equalValues: _verb?.subjectiveParticiple != null
                                ? [_verb!.subjectiveParticiple]
                                : null,
                          )
                        ],
                        []
                      ),
                      title: titles[Tense.subjectiveParticiple]!),
                if (tenses.getValue(Tense.presentParticiple))
                  InputsBlockWidget(
                      validate: _verb != null,
                      fields: (
                        [
                          (
                            name: 'present-participle',
                            hintText: 'Enter present participle',
                            equalValues: _verb?.presentParticiple != null
                                ? [_verb!.presentParticiple]
                                : null,
                          )
                        ],
                        []
                      ),
                      title: titles[Tense.presentParticiple]!),
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
      ),
    );
  }
}
