import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_words/english_words.dart';
import '/screens/motivation_screen.dart'; 


class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(title: const Text('Namer App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to my app'),
            Text(appState.current.asLowerCase),
            ElevatedButton(
              onPressed: (){
                print('button pressed');
                appState.getNext(); // Cambia al siguiente par de palabras
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
