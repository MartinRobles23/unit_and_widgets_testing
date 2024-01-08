import 'package:flutter/material.dart';

import 'presentation/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  final String? initialRoute;
  final Map<String, WidgetBuilder>? routes;

  const MyApp({super.key, this.initialRoute, this.routes});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter testing',
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      initialRoute: initialRoute ?? '/',
      routes: routes ?? appRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
