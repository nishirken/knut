import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:namer_app/keys.dart';
import 'package:namer_app/main.dart';

void main() {
  const emptyErrorMessage = 'This field cannot be empty.';

  Future prepare(WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(2800, 1800));

    await tester.pumpWidget(const KnutApp());
  }

  testWidgets('Shows an empty error of the main verb', (tester) async {
    await prepare(tester);

    final infinitiveInput = find.byKey(keys.verbInput('infinitive'));
    final submitButton = find.byKey(keys.submitButton);

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

    await tester.enterText(infinitiveInput, 'աս');
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
    final submitButton = find.byKey(keys.submitButton);

    await tester.enterText(infinitiveInput, 'աս');
    await tester.tap(submitButton);

    await tester.pumpAndSettle();

    expect(
        find.descendant(
            of: infinitiveInput, matching: find.text('Invalid value')),
        findsOneWidget);
  });

  testWidgets(
      'Shows an empty error of conjugation field, if the main verb is valid',
      (tester) async {
    await prepare(tester);

    final infinitiveInput = find.byKey(keys.verbInput('infinitive'));
    final imperativeInput = find.byKey(keys.verbInput('imperative-singular'));
    final presentInput =
        find.byKey(keys.verbInput('Present simple-singular-first'));
    final submitButton = find.byKey(keys.submitButton);

    await tester.enterText(infinitiveInput, 'ասել');
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
        find.byKey(keys.verbInput('Present simple-singular-first'));
    final submitButton = find.byKey(keys.submitButton);

    await tester.enterText(infinitiveInput, 'ասել');
    await tester.enterText(imperativeInput, 'ա');
    await tester.enterText(presentInput, 'ա');
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
    await prepare(tester);

    await tester.tap(find.byKey(keys.inputsBlockCheckbox('Imperative mood')));

    await tester.pumpAndSettle();

    expect(find.byKey(keys.inputsBlock('Imperative mood')), findsNothing);
  });

  testWidgets('Shows that verb is supported', (tester) async {
    await prepare(tester);

    await tester.enterText(find.byKey(keys.supportedVerbInput), 'ասել');
    await tester.tap(find.byKey(keys.supportedVerbButton));
    await tester.pumpAndSettle();

    expect(find.byKey(keys.supportedVerbIcon(Icons.done)), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 1));
  });

  testWidgets('Shows that verb is not supported', (tester) async {
    await prepare(tester);

    await tester.enterText(find.byKey(keys.supportedVerbInput), 'կարդալ');
    await tester.tap(find.byKey(keys.supportedVerbButton));
    await tester.pumpAndSettle();

    expect(find.byKey(keys.supportedVerbIcon(Icons.close)), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 1));
  });
}
