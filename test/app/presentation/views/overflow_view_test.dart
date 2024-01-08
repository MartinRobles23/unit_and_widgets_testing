import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_and_widget_testing/app/my_app.dart';
import 'package:flutter_unit_and_widget_testing/app/presentation/routes/routes.dart';

void main() {
  testWidgets('Overflow view', (tester) async {
    // Update the physical size only for specified cases (fix errors in view)
    // tester.view.physicalSize =
    // const Size(2400 * 2, 2400 * 2);

    await tester.pumpWidget(const MyApp(initialRoute: Routes.OVERFLOW));

    //addTearDown(tester.view.resetPhysicalSize); // Resetting
  });
}
