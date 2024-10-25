import 'package:flutter/material.dart';
import 'package:navigation/first_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[900], // AppBar color
        ),
      ), // Close ThemeData
      home: const FirstScreen(),
    ); // Close MaterialApp
  }
}
