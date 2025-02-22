import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../styles.dart'; 


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

            if (tasks.isEmpty)
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                decoration: AppStyles.messageContainer,
                child: Text('No hay tareas aún. ¡Agrega una nueva!', style: AppStyles.messageStyle, textAlign: TextAlign.center,),
              ),
              
            for (var task in tasks)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),

                child: Container(
                  decoration: AppStyles.taskContainer,
                  margin: EdgeInsets.symmetric(vertical: 8),  
                  padding: EdgeInsets.all(10),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,       
                    children: [

                      Text(task, style: AppStyles.taskStyle), // ---> TAREA
                      IconButton( // ---> ICONO DE ELIMINAR
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          delete_task(tasks.indexOf(task));
                        },
                      ),
                      
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal.shade900,
        foregroundColor: Colors.white,

        onPressed: () {
          // Show a dialog to add a new task
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Add Task',), // ---> TITULO DEL DIALOGO
                content: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(labelText: 'Task'), // ---> CAMPO DE TEXTO
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    style: AppStyles.buttonStyle,
                    onPressed: () {
                      add_tasks();
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text('Add'), // ---> BOTON DE AGREGAR
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