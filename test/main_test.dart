import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:namer_app/models/verb/verb.dart';
import 'package:namer_app/keys.dart';
import 'package:namer_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  const emptyErrorMessage = 'This field cannot be empty.';

  Future prepare(WidgetTester tester, [Key? scaffoldKey]) async {
    await tester.binding.setSurfaceSize(const Size(3000, 1080));
    SharedPreferences.setMockInitialValues({});
    final app = await appWithProvider(scaffoldKey);
    await tester.pumpWidget(app);
  }

  testWidgets('Shows an empty error of the main verb', (tester) async {
    await prepare(tester);

    final infinitiveInput = find.byKey(keys.verbInput('infinitive'));
    final submitButton = find.byKey(keys.submitButton);

    await tester.ensureVisible(submitButton);
    await tester.tap(submitButton);

    await tester.pumpAndSettle();

    expect(
        find.descendant(
            of: infinitiveInput, matching: find.text(emptyErrorMessage)),
        findsOneWidget);
  });

  testWidgets('Shows an invalid error of the main verb', (tester) async {
    await prepare(tester);

    final infinitiveInput = find.byKey(keys.verbInput('infinitive'));
    final submitButton = find.byKey(keys.submitButton);

    await tester.ensureVisible(infinitiveInput);
    await tester.enterText(infinitiveInput, 'աս');
    await tester.ensureVisible(submitButton);
    await tester.tap(submitButton);

    await tester.pumpAndSettle();

    expect(
        find.descendant(
            of: infinitiveInput, matching: find.text('Invalid value')),
        findsOneWidget);
  });

  testWidgets(
      "Doesn't show an error of conjugation field if the main verb is invalid",
      (tester) async {
    await prepare(tester);

    final imperativeInput = find.byKey(keys.verbInput('imperative-singular'));
    final submitButton = find.byKey(keys.submitButton);

    await tester.ensureVisible(submitButton);
    await tester.tap(submitButton);

    await tester.pumpAndSettle();

    expect(
        find.descendant(
            of: imperativeInput, matching: find.text(emptyErrorMessage)),
        findsNothing);
  });

  testWidgets(
      'Shows an empty error of conjugation field, if the main verb is valid',
      (tester) async {
    await prepare(tester);

    final infinitiveInput = find.byKey(keys.verbInput('infinitive'));
    final imperativeInput = find.byKey(keys.verbInput('imperative-singular'));
    final submitButton = find.byKey(keys.submitButton);

    await tester.ensureVisible(infinitiveInput);
    await tester.enterText(infinitiveInput, 'ասել');
    await tester.ensureVisible(submitButton);
    await tester.tap(submitButton);

    await tester.pumpAndSettle();

    expect(
        find.descendant(
            of: imperativeInput, matching: find.text(emptyErrorMessage)),
        findsOneWidget);
  });

  testWidgets(
      'Shows an empty error of conjugation field, if the main verb is valid',
      (tester) async {
    await prepare(tester);

    final infinitiveInput = find.byKey(keys.verbInput('infinitive'));
    final imperativeInput = find.byKey(keys.verbInput('imperative-singular'));
    final presentInput =
        find.byKey(keys.verbInput('${Tense.present}-singular-first'));
    final submitButton = find.byKey(keys.submitButton);

    await tester.ensureVisible(infinitiveInput);
    await tester.enterText(infinitiveInput, 'ասել');
    await tester.ensureVisible(submitButton);
    await tester.tap(submitButton);

    await tester.pumpAndSettle();

    expect(
        find.descendant(
            of: imperativeInput, matching: find.text(emptyErrorMessage)),
        findsOneWidget);
    expect(
        find.descendant(
            of: presentInput, matching: find.text(emptyErrorMessage)),
        findsOneWidget);
  });

  testWidgets('Shows an invalid error of conjugation field', (tester) async {
    await prepare(tester);

    final infinitiveInput = find.byKey(keys.verbInput('infinitive'));
    final imperativeInput = find.byKey(keys.verbInput('imperative-singular'));
    final presentInput =
        find.byKey(keys.verbInput('${Tense.present}-singular-first'));
    final submitButton = find.byKey(keys.submitButton);

    await tester.ensureVisible(infinitiveInput);
    await tester.enterText(infinitiveInput, 'ասել');
    await tester.enterText(imperativeInput, 'ա');

    await tester.ensureVisible(presentInput);
    await tester.enterText(presentInput, 'ա');

    await tester.ensureVisible(submitButton);
    await tester.tap(submitButton);

    await tester.pumpAndSettle();

    expect(
        find.descendant(
            of: imperativeInput, matching: find.text('The value must be ասա')),
        findsOneWidget);
    expect(
        find.descendant(
            of: presentInput,
            matching: find.text('The value must be ասում եմ')),
        findsOneWidget);
  });

  testWidgets('By default an inputs block is enabled', (tester) async {
    await prepare(tester);

    expect(find.byKey(keys.inputsBlock('Imperative mood')), findsOneWidget);
  });

  testWidgets('An inputs block is disabled by a checkbox', (tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await prepare(tester, scaffoldKey);

    scaffoldKey.currentState?.openDrawer();

    await tester.pumpAndSettle();

    final imperativeCheckbox =
        find.byKey(keys.inputsBlockCheckbox(Tense.imperative));

    await tester.ensureVisible(imperativeCheckbox);
    await tester.tap(imperativeCheckbox);
    scaffoldKey.currentState?.closeDrawer();

    await tester.pumpAndSettle();

    expect(find.byKey(keys.inputsBlock('Imperative mood')), findsNothing);
  });

  testWidgets('Shows that verb is supported', (tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await prepare(tester, scaffoldKey);

    scaffoldKey.currentState?.openDrawer();

    await tester.pumpAndSettle();

    final supportedVerbsInput = find.byKey(keys.supportedVerbInput);
    final supportedVerbsButton = find.byKey(keys.supportedVerbButton);

    await tester.ensureVisible(supportedVerbsInput);
    await tester.enterText(supportedVerbsInput, 'ասել');

    await tester.ensureVisible(supportedVerbsButton);
    await tester.tap(supportedVerbsButton);

    await tester.pumpAndSettle();

    expect(find.byKey(keys.supportedVerbIcon(Icons.done)), findsOneWidget);

    await tester
        .pumpAndSettle(const Duration(seconds: 1)); // wait for pending timeout
  });

  testWidgets('Shows that verb is not supported', (tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await prepare(tester, scaffoldKey);

    scaffoldKey.currentState?.openDrawer();

    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(keys.supportedVerbInput), 'կարդալ');
    await tester.tap(find.byKey(keys.supportedVerbButton));

    await tester.pumpAndSettle();

    expect(find.byKey(keys.supportedVerbIcon(Icons.close)), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 1));
  });
}
