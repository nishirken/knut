import 'package:flutter/material.dart';
import 'package:namer_app/drawer/app_drawer.dart';

class IrregularVerbsDrawer extends StatelessWidget {
  const IrregularVerbsDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppDrawer(
      content: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/check",
              );
            },
            child: const Text("Verbs conjugation")),
      ]),
    );
  }
}
