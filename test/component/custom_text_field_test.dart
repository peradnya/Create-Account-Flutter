import 'package:create_account/component/custom_text_field/custom_text_field.dart';
import 'package:create_account/component/page_header/page_header.dart';
import 'package:create_account/component/step_icon/step_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomTextField components', () {
    testWidgets(
      'Create CustomTextField show hint & label',
      (WidgetTester tester) async {
        final key = GlobalKey<FormState>();
        final controller = TextEditingController();
        final widget = MaterialApp(
          home: Form(
            key: key,
            child: Material(
              child: CustomTextField(
                controller: controller,
                hint: 'Hint',
                label: 'Label',
                validator: (text) {
                  return null;
                },
              ),
            ),
          ),
        );
        await tester.pumpWidget(widget);
        expect(find.text('Hint'), findsOneWidget);
        expect(find.text('Label'), findsOneWidget);
      },
    );
  });
}
