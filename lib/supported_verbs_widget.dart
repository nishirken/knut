import 'dart:async';

import 'package:flutter/material.dart';
import 'package:namer_app/data/irregular_verbs.dart';

class SupportedVerbsWidget extends StatefulWidget {
  final Irregular irregularVerbs;

  const SupportedVerbsWidget({
    super.key,
    required this.irregularVerbs,
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
    return Column(children: [
      TextField(
          controller: _controller,
          onChanged: (value) {},
          decoration: InputDecoration(
              labelText: 'Check if irregular verb is supported',
              icon: isSupported != null
                  ? Icon(
                      isSupported! ? Icons.done : Icons.close,
                      size: 16,
                      color: isSupported! ? Colors.green : Colors.red,
                    )
                  : null)),
      const SizedBox(width: 0, height: 16),
      ElevatedButton(
        onPressed: _handleSubmit,
        child: const Text('Check'),
      )
    ]);
  }
}
