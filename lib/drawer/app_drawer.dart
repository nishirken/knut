import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final Widget content;

  const AppDrawer({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Expanded(child: content)]),
      ),
    );
  }
}
