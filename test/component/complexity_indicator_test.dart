import 'package:create_account/component/complexity_indicator/complexity_indicator.dart';
import 'package:create_account/component/step_icon/step_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ComplexityIndicator components', () {
    testWidgets(
      'Create ComplexityIndicator EMPTY',
      (WidgetTester tester) async {
        final widget = MaterialApp(
            home: ComplexityIndicator(complexity: ComplexityState.EMPTY));
        await tester.pumpWidget(widget);

        expect(
            find.byWidgetPredicate((Widget widget) =>
                widget is RichText &&
                widget.text.toPlainText() == 'Complexity:  '),
            findsOneWidget);
      },
    );
    testWidgets(
      'Create ComplexityIndicator VERY WEAK',
      (WidgetTester tester) async {
        final widget = MaterialApp(
            home: ComplexityIndicator(complexity: ComplexityState.VERY_WEAK));
        await tester.pumpWidget(widget);

        expect(
            find.byWidgetPredicate((Widget widget) =>
                widget is RichText &&
                widget.text.toPlainText() == 'Complexity:  Very Weak'),
            findsOneWidget);
      },
    );

    testWidgets(
      'Create ComplexityIndicator WEAK',
      (WidgetTester tester) async {
        final widget = MaterialApp(
            home: ComplexityIndicator(complexity: ComplexityState.WEAK));
        await tester.pumpWidget(widget);

        expect(
            find.byWidgetPredicate((Widget widget) =>
                widget is RichText &&
                widget.text.toPlainText() == 'Complexity:  Weak'),
            findsOneWidget);
      },
    );

    testWidgets(
      'Create ComplexityIndicator MEDIUM',
      (WidgetTester tester) async {
        final widget = MaterialApp(
            home: ComplexityIndicator(complexity: ComplexityState.MEDIUM));
        await tester.pumpWidget(widget);

        expect(
            find.byWidgetPredicate((Widget widget) =>
                widget is RichText &&
                widget.text.toPlainText() == 'Complexity:  Medium'),
            findsOneWidget);
      },
    );

    testWidgets(
      'Create ComplexityIndicator STRONG',
      (WidgetTester tester) async {
        final widget = MaterialApp(
            home: ComplexityIndicator(complexity: ComplexityState.STRONG));
        await tester.pumpWidget(widget);

        expect(
            find.byWidgetPredicate((Widget widget) =>
                widget is RichText &&
                widget.text.toPlainText() == 'Complexity:  Strong'),
            findsOneWidget);
      },
    );

    testWidgets(
      'Create ComplexityIndicator VERY STRONG',
      (WidgetTester tester) async {
        final widget = MaterialApp(
            home: ComplexityIndicator(complexity: ComplexityState.VERY_STRONG));
        await tester.pumpWidget(widget);

        expect(
            find.byWidgetPredicate((Widget widget) =>
                widget is RichText &&
                widget.text.toPlainText() == 'Complexity:  Very Strong'),
            findsOneWidget);
      },
    );
  });
}
