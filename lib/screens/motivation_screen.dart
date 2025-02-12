import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../styles.dart'; 


class MotivationPage extends StatefulWidget {
  const MotivationPage({super.key});

  @override
  _MotivationPageState createState() => _MotivationPageState();
}

class _MotivationPageState extends State<MotivationPage> {
  String current = 'Cargando frase...';

  @override
  void initState() {
    super.initState();
    fetchData(); // Cargar la frase cuando la pantalla se inicie
  }

  Future<void> fetchData() async {
    var url = Uri.parse('https://www.affirmations.dev/');
    try {
      var response = await http.get(url);
      print("Response body: ${response.body}");
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          current = data['affirmation'] ?? 'Frase no disponible';
        });
      } else {
        setState(() {
          current = 'Error en la solicitud: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        current = 'Ocurrió un error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Frase del día')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: AppStyles.messageContainer,
              child: Text(current, style: AppStyles.messageStyle) //---> FRASE
            ),
            
            ElevatedButton( //---> BOTON
              style: AppStyles.buttonStyle,
              onPressed: () {
                print('button pressed');
                fetchData(); // Cambia a la siguiente frase
              },
              child: const Text('Otro!'),
            ),
          ],
        ),
      ),
    );
  }
}
