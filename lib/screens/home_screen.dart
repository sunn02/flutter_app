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
            const Text('Welcome!', style: AppStyles.titleStyle),
            Image.asset('images/https___bestanimations_com_media_beverages_1085588754tea-suacer-animated-gif-2.gif'),
            ElevatedButton(
              onPressed: (){
                print('button 1 pressed');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TasksPage()),
                );
              }, 
              child: const Text('Tareas'),
            ),
            ElevatedButton(
              onPressed: () {
                 print('button 2 pressed');
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
