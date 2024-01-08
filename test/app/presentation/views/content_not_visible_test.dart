import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_and_widget_testing/app/my_app.dart';
import 'package:flutter_unit_and_widget_testing/app/presentation/routes/routes.dart';

void main() {
  testWidgets('Content not visible', (tester) async {
    await tester
        .pumpWidget(const MyApp(initialRoute: Routes.CONTENT_NOT_VISIBLE));

    await tester.pumpWidget(
      const MyApp(initialRoute: Routes.CONTENT_NOT_VISIBLE),
    );

    final textFinder = find.text('show message');

    await tester.dragFrom(const Offset(100, 100),
        const Offset(100, -10000)); // This generates a scroll
    await tester.pumpAndSettle();

    expect(textFinder, findsOneWidget);

    // await tester.ensureVisible(textFinder); -> Only for scroll widgets (SingleChildScrollView, CustomScrollView, etc)

    await tester.tap(textFinder);

    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
  });
}
