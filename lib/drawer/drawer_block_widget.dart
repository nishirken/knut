import 'package:flutter/material.dart';

class DrawerBlockWidget extends StatelessWidget {
  final Widget child;

  const DrawerBlockWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        child: child);
  }
}
