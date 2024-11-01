import 'package:easy_form_validator/easy_form_validator.dart';
import 'package:test/test.dart';

void main() {
  group('required', () {
    setUp(() {
      // Additional setup goes here.
    });
    test('should return null', () {
      final form = FormValidator(value: 'email@email.com');
      expect(form.required().validate(), isNull);
    });

    test('should return error', () {
      final form = FormValidator(value: '');
      expect(form.required(errorMessage: 'Email is required').validate(),
          'Email is required');
    });
  });
}
