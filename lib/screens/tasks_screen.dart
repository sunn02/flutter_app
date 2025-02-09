import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {

  TextEditingController _controller = TextEditingController(); // Manages text input fields, such as TextField or TextFormField 
  List<String> tasks = []; 


  @override
  void initState() {
    super.initState();
    _loadTasks();  
  }

  _loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      tasks = prefs.getStringList('tasks') ?? [];  
    });
  }

  _saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('tasks', tasks);  
  }


  void add_tasks() {
      setState(() {
          String userInput = _controller.text;
          if (userInput.isNotEmpty) {
            tasks.add(userInput); 
            _controller.clear(); 
            _saveTasks(); 
          }
      });
  }

  void delete_task(int index) {
    setState((){
      tasks.removeAt(index);
      _saveTasks(); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Tareas')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Show a dialog to add a new task
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Add Task'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(labelText: 'Task'),
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      add_tasks();
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        icon: Icon(Icons.add, size: 25),
        label: const Text('Add Task'),
      ),
    );
  }
}
