import 'package:create_account/page/create_account_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Main Page', () {
    testWidgets(
      'Page Transition',
      (WidgetTester tester) async {
        final widget = MaterialApp(
          home: CreateAccountPage(),
        );
        await tester.pumpWidget(widget);

        expect(
            find.text(
                'Welcome to The Bank of The Future. Manage and track your accounts on the go.'),
            findsOneWidget);

        await tester.enterText(find.byType(TextFormField), 'email@email.com');
        await tester.pumpAndSettle();
        await tester.tap(find.byType(RaisedButton));
        await tester.pumpAndSettle();

        expect(find.text('Password will be used to login to account'),
            findsOneWidget);

        await tester.enterText(find.byType(TextFormField), '123ABCabc');
        await tester.pumpAndSettle();
        await tester.tap(find.byType(RaisedButton));
        await tester.pumpAndSettle();

        expect(
            find.text(
                'Please fill in the information below and your goal for digital saving.'),
            findsOneWidget);
      },
    );
  });
}
