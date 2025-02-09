import 'dart:convert';
import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {

  TextEditingController _controller = TextEditingController(); // Manages text input fields, such as TextField or TextFormField 
  List<String> tasks = []; 

  void add_tasks() {
      setState(() {
          String userInput = _controller.text;
          if (userInput.isNotEmpty) {
            tasks.add(userInput); 
            _controller.clear(); 
          }
      });
  }

  void delete_task(int index) {
    setState((){
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tasks')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
            controller: _controller, 
            ),
            ElevatedButton(
              onPressed: () {
                add_tasks();
              },
              child: Text('Agregar tarea'),
            ),

            for (var task in tasks)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(task),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      delete_task(tasks.indexOf(task));
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
