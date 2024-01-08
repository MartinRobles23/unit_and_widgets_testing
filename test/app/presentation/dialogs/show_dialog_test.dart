import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_and_widget_testing/app/presentation/dialogs/show_loader.dart';

void main() {
  testWidgets('Show loader', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: _Home()));
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });
}

class _Home extends StatefulWidget {
  const _Home({super.key});

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showLoader(
            context,
            Future.delayed(
              const Duration(milliseconds: 300),
            ),
          );
        },
      ),
    );
  }
}
