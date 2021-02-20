import 'package:create_account/component/custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomDropdown components', () {
    testWidgets(
      'Create CustomDropdown show hint & label',
      (WidgetTester tester) async {
        final key = GlobalKey<FormState>();

        const items = [0, 1, 2, 3];
        var value = 0;

        final widget = MaterialApp(
          home: Form(
            key: key,
            child: Material(
              child: CustomDropDown(
                label: 'Label',
                hint: 'Hint',
                items: items.map((e) {
                  return DropdownMenuItem(
                    child: Text(e.toString()),
                    value: e,
                  );
                }).toList(),
                validator: (value) {
                  return null;
                },
                value: value,
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
