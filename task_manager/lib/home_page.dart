import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'add_task_dialog.dart';
import 'task_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> _tasks = [
    {'title': 'This is an example of task', 'date': '01-10-2021'},
  ];

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
        child: ListView.builder(
            itemCount: _tasks.length,
            itemBuilder: (context, index) {
              return TaskCard(
                title: _tasks[index]['title']!,
                date: _tasks[index]['date']!,
                onDelete: () => deleteTask(index),
              );
            }),
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
      _tasks.add({'title': title, 'date': date});
    });
  }

  void deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }
}
