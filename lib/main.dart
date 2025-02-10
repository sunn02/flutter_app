import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/screens/home_screen.dart'; 
import '/screens/motivation_screen.dart';
import 'styles.dart';
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
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
          fontFamily: 'PressStart2P',  
          textTheme: TextTheme(
            displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(fontSize: 16),
        ),
        ),
        home: const MyHomePage(), // Llama al widget desde home.dart
    );
  }
}
