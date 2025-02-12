import 'package:flutter/material.dart';


class AppStyles {
  static final TextStyle titleStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600, // Estilo menos fuerte que el negrita
    color: Colors.teal.shade900,
  );

  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 14,
    color: Colors.black,
  );

  static const TextStyle taskStyle = TextStyle(
    fontSize: 13,
    color: Colors.black87, // Color más suave para el texto
  );

  static const TextStyle messageStyle = TextStyle(
    fontSize: 15,
    color: Colors.black87,
  );

  static BoxDecoration messageContainer = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    color: Colors.white,
    border: Border.all(
    color: Colors.teal.shade900,
    width: 3,// Grosor del borde
    ),
    
  );

  static final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    elevation: 4, 
    shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    backgroundColor: Colors.teal.shade900,
    foregroundColor: Colors.white,
    
  );

  static BoxDecoration taskContainer = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(10)),
    border: Border.all(
    color: Colors.teal.shade900,
    width: 3,// Grosor del borde
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        blurRadius: 5,
        offset: Offset(0, 3),
      ),
    ],
  );
}