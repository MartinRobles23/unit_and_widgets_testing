import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_and_widget_testing/app/my_app.dart';
import 'package:flutter_unit_and_widget_testing/app/presentation/routes/routes.dart';

void main() {
  testWidgets('Counter view', (tester) async {
    await tester.pumpWidget(const MyApp(initialRoute: Routes.COUNTER));

    final textFinder = find.text('0');
    expect(textFinder, findsOneWidget);
    final btnFinder = find.byKey(const Key('fBtn')); // By key

    for (int i = 0; i < 5; i++) {
      await tester.tap(btnFinder);
      await tester.pump(); // Update view
      expect(find.text((i + 1).toString()), findsOneWidget);
    }

    await tester.pumpAndSettle(); // Update view after animations
    expect(btnFinder, findsNothing);

    //final btnFinder = find.byType(FloatingActionButton); By type
    //await tester.tap(btnFinder.first);
    //btnFinder.at(0);
    // await tester.tap(btnFinder);

    /*await tester.tap(btnFinder);
    await tester.pump(); // Update view
    expect(find.text('2'), findsWidgets);

    await tester.tap(btnFinder);
    await tester.pump(); // Update view
    expect(find.text('3'), findsWidgets);

    await tester.tap(btnFinder);
    await tester.pump(); // Update view
    expect(find.text('4'), findsWidgets);

    await tester.tap(btnFinder);
    await tester.pump(); // Update view
    expect(find.text('5'), findsWidgets);*/
  });

  testWidgets('Conter view nav ABC', (tester) async {
    await tester.pumpWidget(const MyApp(initialRoute: Routes.COUNTER));

    await tester.tap(find.byKey(const Key('iconBtn_abc')));
    await tester.pumpAndSettle();
    expect(find.text('Screen ABC'), findsWidgets);
  });
}
