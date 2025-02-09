import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/screens/home_screen.dart'; 
import '/screens/motivation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: const MyHomePage(), // Llama al widget desde home.dart
    );
  }
}
