import 'package:create_account/utils/date_format.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Date and Time Formating', () {
    test('Format date when DateTime is null', () {
      expect(DateFormat.formatDate(null), '');
    });

    test('Format date when DateTime is available', () {
      final date = DateTime(2021, 02, 19);
      expect(DateFormat.formatDate(date), 'Jumat, 19 Feb 2021');
    });

    test('Format time when DateTime is null', () {
      expect(DateFormat.formatTime(null), '');
    });

    test('Format time when DateTime is available', () {
      final date = DateTime(2021, 02, 19, 0, 0);
      expect(DateFormat.formatTime(date), '00:00');
    });
  });
}
