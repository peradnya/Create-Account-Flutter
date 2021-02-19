import 'package:create_account/component/step_icon/step_icon.dart';
import 'package:create_account/component/step_indicator/step_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StepIndicator components', () {
    testWidgets(
      'Create StepIndicator max 4, step 0',
      (WidgetTester tester) async {
        final widget =
            MaterialApp(home: StepIndicator(currentStep: 0, maxStep: 4));
        await tester.pumpWidget(widget);
        expect(find.byType(StepIcon), findsNWidgets(4));
      },
    );

    testWidgets(
      'Create StepIndicator max 5, step 2',
      (WidgetTester tester) async {
        final widget =
            MaterialApp(home: StepIndicator(currentStep: 2, maxStep: 5));
        await tester.pumpWidget(widget);

        final stepIcons =
            (tester.widgetList<StepIcon>(find.byType(StepIcon)).toList());

        expect(stepIcons[0].isFinished, true);
        expect(stepIcons[1].isFinished, true);
        expect(stepIcons[2].isFinished, false);
        expect(stepIcons[3].isFinished, false);
        expect(stepIcons[4].isFinished, false);
      },
    );
  });
}
