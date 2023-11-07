import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:namer_app/irregular_verbs_screen/keys.dart';
import 'package:namer_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Future prepare(WidgetTester tester,
      [Key? checkScreenKey, Key? irregularVerbsKeys]) async {
    await tester.binding.setSurfaceSize(const Size(3000, 1080));
    SharedPreferences.setMockInitialValues({});
    final app =
        await appWithProvider(checkScreenKey, irregularVerbsKeys, '/irregular');
    await tester.pumpWidget(app);
  }

  testWidgets('Shows VerbsInfoWidget', (tester) async {
    await prepare(tester);
    expect(find.byKey(keys.verbsInfoBlock('ասել')), findsOneWidget);
  });

  testWidgets('Searches a verb', (tester) async {
    await prepare(tester);
    await tester.enterText(find.byKey(keys.searchInput), "գա");
    await tester.pumpAndSettle();
    expect(find.byKey(keys.verbsInfoBlock('ասել')), findsNothing);
    expect(find.byKey(keys.verbsInfoBlock('գալ')), findsOneWidget);
  });

  testWidgets('Shows irregular verb info', (tester) async {
    await prepare(tester);
    expect(find.byKey(keys.verbsInfoBlock('ասել')), findsNothing);
  });
}
