import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_and_widget_testing/app/my_app.dart';
import 'package:flutter_unit_and_widget_testing/app/presentation/routes/routes.dart';

void main() {
  testWidgets('Dropdown view', (tester) async {
    await tester.pumpWidget(const MyApp(initialRoute: Routes.DROPDOWN));

    expect(find.text('select one option'), findsOneWidget);

    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('item_yes')), findsOneWidget);
    expect(find.byKey(const Key('item_no')), findsOneWidget);

    await tester.tap(find.text('yes'));
    await tester.pumpAndSettle();

    expect(find.text('select one option'), findsNothing);
    expect(find.text('yes'), findsOneWidget);
  });
}
