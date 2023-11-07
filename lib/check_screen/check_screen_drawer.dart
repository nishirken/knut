import 'package:flutter/material.dart';
import 'package:namer_app/check_screen/toggle_tenses_widget.dart';
import 'package:namer_app/drawer/app_drawer.dart';
import 'package:namer_app/drawer/drawer_block_widget.dart';

class CheckScreenDrawer extends StatelessWidget {
  const CheckScreenDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AppDrawer(
      content: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Expanded(child: DrawerBlockWidget(child: ToggleTensesWidget())),
        SizedBox(height: 16),
      ]),
    );
  }
}
