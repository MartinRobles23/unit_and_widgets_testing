import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_and_widget_testing/app/presentation/utils/capitalize.dart';

void main() {
  test('Capitalize', () {
    expect(capitalize(''), '');
    expect(capitalize('a'), 'A');
    expect(capitalize('HELLO'), 'Hello');
  });
}
