import 'package:flutter/material.dart';
import 'package:namer_app/check_screen/check_screen.dart';
import 'package:namer_app/irregular_verbs_screen/irregular_verbs_screen.dart';
import 'package:namer_app/models/enabled_tenses.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final app = await appWithProvider();
  runApp(app);
}

Future<MultiProvider> appWithProvider(
    [Key? checkScreenKey, Key? irregularVerbsKey, String? initialRoute]) async {
  final sharedPreferences = await SharedPreferences.getInstance();

  return MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (c) => EnabledTenses(sharedPreferences: sharedPreferences))
    ],
    child: KnutApp(
        checkScreenKey: checkScreenKey,
        irregularVerbsKey: irregularVerbsKey,
        initialRoute: initialRoute),
  );
}

class KnutApp extends StatelessWidget {
  final Key? checkScreenKey;
  final Key? irregularVerbsKey;
  final String? initialRoute;

  const KnutApp(
      {this.checkScreenKey,
      this.irregularVerbsKey,
      this.initialRoute,
      super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: initialRoute ?? '/check',
      routes: {
        '/check': (context) =>
            CheckScreenWithScaffold(scaffoldKey: checkScreenKey),
        '/irregular': (context) =>
            IrregularVerbsScreenWithScaffold(scaffoldKey: irregularVerbsKey),
      },
    );
  }
}
