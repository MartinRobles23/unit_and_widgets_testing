import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_and_widget_testing/app/presentation/utils/validator.dart';

void main() {
  test('Is valid email', () {
    expect(isValidEmail('robles@test.com'), true);

    expect(isValidEmail('FAKE'), false);
    expect(isValidEmail('robl#es@test.com'), false);
    expect(isValidEmail('12robles@test.com'), false);
  });

  group('Is valid password ->', () {
    test('Empty text', () {
      final errors = isValidPassword(' ');
      expect(errors.length, 4);
    });

    test('White space', () {
      final errors = isValidPassword('test white space');
      expect(errors.contains(PasswordErrors.whiteSpaces), true);
    });

    test('At least 6 characters', () {
      final errors = isValidPassword('testabc');
      expect(errors.contains(PasswordErrors.atLeast6Characters), false);
    });

    test('At least 1 number', () {
      final errors = isValidPassword('test1');
      expect(errors.contains(PasswordErrors.atLeast1Number), false);
    });

    test('At least 1 Uppercase', () {
      final errors = isValidPassword('tesT');
      expect(errors.contains(PasswordErrors.atLeast1UpperCase), false);
    });

    test('Success', () {
      final errors = isValidPassword('Test0210');
      expect(errors.isEmpty, true);
    });
  });

  /*test('Is valid password', () {
    var errors = isValidPassword('test');
    expect(errors.length, 3);

    errors = isValidPassword('testabc');
    expect(errors.contains(PasswordErrors.atLeast6Characters), false);

    errors = isValidPassword('testabc1');
    expect(errors.contains(PasswordErrors.atLeast1Number), false);

    errors = isValidPassword('testAb c1');
    expect(errors.isEmpty, false);

    errors = isValidPassword('testAbc1');
    expect(errors.isEmpty, true);

    /*expect(errors.contains(PasswordErrors.atLeast6Characters), true);
    expect(errors.contains(PasswordErrors.atLeast1UpperCase), true);
    expect(errors.contains(PasswordErrors.atLeast1Number), true);*/
  });*/
}
