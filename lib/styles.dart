import 'package:flutter/material.dart';

class AppStyles {
  // Estilo para títulos
  static const TextStyle titleStyle = TextStyle(
    fontFamily: 'Press Start 2P',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 0, 0, 0),
  );

  // Estilo para tareas
  static const TextStyle taskStyle = TextStyle(
    fontSize: 18,
    color: Colors.black87,
  );

  // Estilo para frases
  static const TextStyle affirmationStyle = TextStyle(
    fontSize: 20,
    color: Colors.black87,
  );

  // Estilo para botones
  static final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  );

  // Estilo para el fondo del contenedor
  static const BoxDecoration taskContainer = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 5,
        offset: Offset(0, 3),
      ),
    ],
  );
}
