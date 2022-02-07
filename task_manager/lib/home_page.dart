import 'package:flutter/material.dart';

import 'add_task_dialog.dart';
import 'task_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _tasks = [
    {
      'title': 'This is an example of task',
      'date': '01-10-2021',
      'completed': false
    },
  ];
  bool showCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => addTaskWidget(),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.grey.shade200,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return showCompleted == _tasks[index]['completed']
                      ? TaskCard(
                          title: _tasks[index]['title']!,
                          date: _tasks[index]['date']!,
                          completed: _tasks[index]['completed']!,
                          onDelete: () => deleteTask(index),
                          markAsCompleted: () => changeStatus(index),
                        )
                      : Container();
                },
              ),
            ),
            TextButton(
                onPressed: () => setState(() {
                      showCompleted = !showCompleted;
                    }),
                child: const Text('Show Completed Tasks')),
          ],
        ),
      ),
    );
  }

  addTaskWidget() {
    showDialog(
      context: context,
      builder: (context) => AddTaskDialog(addTask: addTask),
    );
  }

  void addTask(String title, String date) {
    setState(() {
      _tasks.add({'title': title, 'date': date, 'completed': false});
    });
  }

  void changeStatus(int index) {
    setState(() {
      _tasks[index]['completed'] = !_tasks[index]['completed'];
    });
  }

  void deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }
}
