import 'package:flutter/material.dart';

class PageWidget extends StatelessWidget {
  final Widget child;

  const PageWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          )),
    );
  }
}
