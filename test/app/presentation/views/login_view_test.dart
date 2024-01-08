import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_and_widget_testing/app/my_app.dart';
import 'package:flutter_unit_and_widget_testing/app/presentation/routes/routes.dart';
import 'package:flutter_unit_and_widget_testing/app/presentation/utils/validator.dart';

void main() {
  final emailFinder = find.byKey(const Key('input_email'));
  final passwordFinder = find.byKey(const Key('input_password'));
  final buttonFinder = find.byType(ElevatedButton);

  testWidgets('Login view -> invalid fiels', (tester) async {
    // await tester.pumpWidget(const MaterialApp(home: LoginView()));
    await _initView(tester);
    expect(find.text('Invalid email'), findsNothing);
    await tester.tap(buttonFinder);
    await tester.pump();
    expect(find.text('Invalid email'), findsOneWidget);

    // Set email
    await tester.enterText(emailFinder, 'test@test.com');
    await tester.pump();
    expect(find.text('Invalid email'), findsNothing);

    //Set password
    await tester.enterText(passwordFinder, 'Test123@');
    await tester.pump();
    expect(find.text('Invalid email'), findsNothing);
    expect(find.text(PasswordErrors.whiteSpaces), findsNothing);
    expect(find.text(PasswordErrors.atLeast1Number), findsNothing);
    expect(find.text(PasswordErrors.atLeast1UpperCase), findsNothing);
    expect(find.text(PasswordErrors.atLeast6Characters), findsNothing);
  });

  testWidgets('Login view -> Invalid credentials', (tester) async {
    await _initView(tester);

    // Set email
    await tester.enterText(emailFinder, 'test@test.com');
    //Set password
    await tester.enterText(passwordFinder, 'Test123@123');

    await tester.pump();
    await tester.tap(buttonFinder);
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    // await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();
    expect(find.text('Invalid email or password'), findsOneWidget);
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    expect(find.text('Invalid email or password'), findsNothing);
  });

  testWidgets('Login view -> Valid credentials', (tester) async {
    await _initView(tester);

    // Set email
    await tester.enterText(emailFinder, 'test@test.com');
    //Set password
    await tester.enterText(passwordFinder, 'Test123@');

    await tester.pump();
    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    expect(find.text('Invalid email or password'), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsNothing);

    expect(find.text('home page'), findsOneWidget);
  });
}

Future<void> _initView(WidgetTester tester) {
  /*return tester.pumpWidget(MaterialApp(
    home: const LoginView(),
    routes: {Routes.HOME: (context) => const HomeView()},
  ));*/
  return tester.pumpWidget(const MyApp(initialRoute: Routes.LOGIN));
}
