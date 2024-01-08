import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_and_widget_testing/app/di/service_locator.dart';

void main() {
  setUp(
    () {
      ServiceLocator.intance.clear();
    },
  );

  test('Service locator -> put', () {
    expect(() {
      ServiceLocator.intance.find<String>();
    }, throwsAssertionError);
    final name = ServiceLocator.intance.put<String>('Robles');
    expect(name, ServiceLocator.intance.find<String>());
  });

  test('Service locator -> put 2', () {
    ServiceLocator.intance.put('Robles');
    ServiceLocator.intance.put('Testing', tag: 'name2');

    final user = ServiceLocator.intance.put(User(name: 'Martin'));
    expect(ServiceLocator.intance.find<User>(), user);

    final name = ServiceLocator.intance.find<String>(tag: 'name2');
    expect(ServiceLocator.intance.find<String>(), 'Robles');
    expect(name, 'Testing');

    // ServiceLocator.intance.find<String>();
  });
}

class User {
  final String name;

  User({required this.name});
}
