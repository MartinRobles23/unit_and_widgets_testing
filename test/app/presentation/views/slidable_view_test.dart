import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_and_widget_testing/app/my_app.dart';
import 'package:flutter_unit_and_widget_testing/app/presentation/routes/routes.dart';

void main() {
  testWidgets('Slidable view', (tester) async {
    await tester.pumpWidget(const MyApp(initialRoute: Routes.SLIDABLE));
    final width = tester.getSize(find.byType(Scaffold)).width;
    final center = tester.getCenter(find.byType(Slidable).first);
    final slidableKey =
        tester.widget<Slidable>(find.byType(Slidable).first).key;

    expect(find.byKey(slidableKey!), findsOneWidget);

    await tester.dragFrom(
      Offset(width - 10, center.dy),
      Offset(-center.dx, center.dy),
    );

    await tester.pumpAndSettle();
    expect(find.byType(SlidableAction), findsWidgets);

    await tester.tap(find.byType(SlidableAction));
    await tester.pumpAndSettle();
    expect(find.byKey(slidableKey), findsNothing);
  });

  testWidgets('Slidable view -> complete slide', (tester) async {
    await tester.pumpWidget(const MyApp(initialRoute: Routes.SLIDABLE));
    final width = tester.getSize(find.byType(Scaffold)).width;
    final center = tester.getCenter(find.byType(Slidable).first);
    final slidableKey =
        tester.widget<Slidable>(find.byType(Slidable).first).key;

    expect(find.byKey(slidableKey!), findsOneWidget);

    await tester.timedDragFrom(
      Offset(width - 10, center.dy),
      Offset(-width, center.dy),
      const Duration(milliseconds: 400),
    );

    await tester.pumpAndSettle();
    expect(find.byKey(slidableKey), findsNothing);
  });
}
