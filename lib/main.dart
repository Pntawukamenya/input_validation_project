import 'package:flutter/material.dart';
import 'screens/screen1.dart'; // Import Screen1
import 'screens/screen2.dart'; // Import Screen2

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Form App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Set initial route
      routes: {
        '/': (context) => const Screen1(), // Define route for Screen1
        '/screen2': (context) => const Screen2(), // Define route for Screen2
      },
    );
  }
}