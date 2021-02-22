import 'package:create_account/page/create_account_page.dart';
import 'package:flutter/material.dart';

/// Main entry point of application.
void main() {
  runApp(MyApp());
}

/// [MyApp] is the main class of application.
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GIN Finans',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CreateAccountPage(),
    );
  }
}
