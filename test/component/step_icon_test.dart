import 'package:create_account/component/step_icon/step_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StepIcon components', () {
    testWidgets(
      'Create StepIcon text A, isFinished false',
      (WidgetTester tester) async {
        final widget =
            MaterialApp(home: StepIcon(text: 'A', isFinished: false));
        await tester.pumpWidget(widget);
        expect(find.text('A'), findsOneWidget);
        expect(
            ((tester.widget(find.byType(Container)) as Container).decoration
                    as BoxDecoration)
                .color,
            Colors.white);
      },
    );

    testWidgets(
      'Create StepIcon text B, isFinished true',
      (WidgetTester tester) async {
        final widget = MaterialApp(home: StepIcon(text: 'B', isFinished: true));
        await tester.pumpWidget(widget);
        expect(find.text('B'), findsOneWidget);
        expect(
            ((tester.widget(find.byType(Container)) as Container).decoration
                    as BoxDecoration)
                .color,
            Colors.green);
      },
    );
  });
}
