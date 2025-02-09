import 'dart:convert';
import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {

  TextEditingController _controller = TextEditingController();
  List<String> tasks = []; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tasks')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Aca van las tareas'),
            TextField(
            controller: _controller, 
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                    String userInput = _controller.text;
                  if (userInput.isNotEmpty) {
                    tasks.add(userInput); 
                    _controller.clear(); 
                  }
                });
              },
              child: Text('Agregar tarea'),
            ),

            for (var task in tasks)
              Text(task),
          ],
        ),
      ),
    );
  }
}
