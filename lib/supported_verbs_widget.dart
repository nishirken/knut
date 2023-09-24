import 'dart:async';

import 'package:flutter/material.dart';
import 'package:namer_app/data/irregular_verbs.dart';
import 'package:namer_app/keys.dart';

class SupportedVerbsWidget extends StatefulWidget {
  final Irregular irregularVerbs =
      IrregularVerbsCollection(infinitive: '', stamp: '').collection;

  SupportedVerbsWidget({
    super.key,
  });

  @override
  State<SupportedVerbsWidget> createState() => _SupportedVerbsWidgetState();
}

class _SupportedVerbsWidgetState extends State<SupportedVerbsWidget> {
  final TextEditingController _controller = TextEditingController();

  bool? isSupported;

  void _handleSubmit() {
    setState(() {
      isSupported = widget.irregularVerbs.keys
          .contains(_controller.value.text.toLowerCase().trim());
    });
    Timer(const Duration(seconds: 1), () {
      setState(() {
        isSupported = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final icon = isSupported == true ? Icons.done : Icons.close;

    return SizedBox(
      height: 300,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        TextField(
            key: keys.supportedVerbInput,
            controller: _controller,
            onChanged: (value) {},
            decoration: InputDecoration(
                labelText: 'Check if irregular verb is supported',
                icon: isSupported != null
                    ? Icon(
                        key: keys.supportedVerbIcon(icon),
                        icon,
                        size: 16,
                        color: isSupported! ? Colors.green : Colors.red,
                      )
                    : null)),
        const SizedBox(width: 0, height: 16),
        ElevatedButton(
          key: keys.supportedVerbButton,
          onPressed: _handleSubmit,
          child: const Text('Check'),
        )
      ]),
    );
  }
}
