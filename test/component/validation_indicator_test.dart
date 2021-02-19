import 'package:create_account/component/step_icon/step_icon.dart';
import 'package:create_account/component/validation_indicator/validation_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ValidationIndicator components', () {
    testWidgets(
      'Create ValidationIndicator title A, subtitle B, not valid',
      (WidgetTester tester) async {
        final widget = MaterialApp(
            home: ValidationIndicator(valid: false, title: 'A', subtitle: 'B'));
        await tester.pumpWidget(widget);

        expect(find.text('A'), findsOneWidget);
        expect(find.text('B'), findsOneWidget);
      },
    );

    testWidgets(
      'Create ValidationIndicator title A, subtitle B, valid',
      (WidgetTester tester) async {
        final widget = MaterialApp(
            home: ValidationIndicator(valid: true, title: 'A', subtitle: 'B'));
        await tester.pumpWidget(widget);

        expect(find.text('A'), findsNothing);
        expect(find.text('B'), findsOneWidget);
      },
    );
  });
}
