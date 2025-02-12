import 'package:app/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/screens/motivation_screen.dart'; 
import '/screens/tasks_screen.dart'; 
import '../styles.dart'; 

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('InspireMe')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('¡Welcome!', style: AppStyles.titleStyle),

            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: AppStyles.messageContainer,
              child: const Text('Encuentra motivación y organiza tus tareas en un solo lugar.', style: AppStyles.subtitleStyle, textAlign: TextAlign.center,),
            ),

            ElevatedButton( // ---> BOTON DE TAREAS
              style: AppStyles.buttonStyle,
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TasksPage()),
                );
              }, 
              child: const Text('Tareas'),
            ),

            SizedBox(height: 16),

            ElevatedButton( // ---> BOTON DE FRASES
              style: AppStyles.buttonStyle,
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute
                    (builder: (context) => const MotivationPage()),
                 );
              }, 
              child: const Text('Frases'),
            ),
          ],
        ),
      ),
    );
  }
}
