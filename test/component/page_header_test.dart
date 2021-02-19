import 'package:create_account/component/page_header/page_header.dart';
import 'package:create_account/component/step_icon/step_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PageHeader components', () {
    testWidgets(
      'Create PageHeader title A, subtitle B',
      (WidgetTester tester) async {
        final widget = MaterialApp(
          home: PageHeader(
            title: 'A',
            subtitle: 'B',
          ),
        );
        await tester.pumpWidget(widget);
        expect(find.text('A'), findsOneWidget);
        expect(find.text('B'), findsOneWidget);
      },
    );
  });
}
