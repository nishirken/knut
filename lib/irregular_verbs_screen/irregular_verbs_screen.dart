import 'package:flutter/material.dart';
import 'package:namer_app/irregular_verbs_screen/keys.dart';
import 'package:namer_app/irregular_verbs_screen/verb_info_widget.dart';
import 'package:namer_app/models/verb/irregular_verbs.dart';
import 'package:namer_app/models/verb/verb.dart';
import 'package:namer_app/page_widget.dart';

class IrregularVerbsScreenWithScaffold extends StatelessWidget {
  final Key? scaffoldKey;

  const IrregularVerbsScreenWithScaffold({super.key, this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("Irregular verbs"),
        actions: [
          ElevatedButton(
              key: keys.checkScreenButton,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/check",
                );
              },
              child: const Text("Verbs conjugation"))
        ],
      ),
      body: const IrregularVerbsScreen(),
    );
  }
}

class IrregularVerbsScreen extends StatefulWidget {
  const IrregularVerbsScreen({super.key});

  @override
  State<IrregularVerbsScreen> createState() => _IrregularVerbsScreenState();
}

class _IrregularVerbsScreenState extends State<IrregularVerbsScreen> {
  String _searchedValue = "";

  final Irregular _irregularVerbs =
      IrregularVerbsCollection(infinitive: 'ասել', stamp: 'աս').collection;

  Iterable<Verb> _shownVerbs() {
    return _irregularVerbs.entries
        .where((entry) => entry.key
            .trim()
            .toLowerCase()
            .contains(_searchedValue.trim().toLowerCase()))
        .map((entry) => Verb.create(entry.key));
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      key: keys.root,
      child: ListView(children: [
        TextField(
            key: keys.searchInput,
            decoration: const InputDecoration(
              hintText: "Search",
            ),
            onChanged: (value) {
              setState(() {
                _searchedValue = value;
              });
            }),
        ..._shownVerbs().map((verb) {
          return VerbInfoWidget(
              verb: verb, key: keys.verbsInfoBlock(verb.infinitive));
        }).toList()
      ]),
    );
  }
}
