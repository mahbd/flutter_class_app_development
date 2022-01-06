import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  final List<TaskCard> _tasks = [
    const TaskCard(title: 'This is an example of task', date: '01-10-2021'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => addTask(),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(),
      body: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.grey.shade200,
          child: Column(
            children: _tasks,
          )),
    );
  }

  addTask() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Alert Dialog'),
        content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Task title'),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const Text('Task date'),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _dateController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ]),
        actions: <Widget>[
          TextButton(
            child: const Text('Add'),
            onPressed: () => {
              setState(() {
                _tasks.add(TaskCard(
                    title: _titleController.text, date: _dateController.text));
                _titleController.clear();
                _dateController.clear();
                Navigator.pop(context);
              })
            },
          ),
          TextButton(
            onPressed: () => {
              _titleController.clear(),
              _dateController.clear(),
              Navigator.of(context).pop(),
            },
            child: const Text('Cancel'),
          )
        ],
      ),
    );
  }
}

class TaskCard extends StatefulWidget {
  const TaskCard({
    Key? key,
    required this.title,
    required this.date,
  }) : super(key: key);

  final String title;
  final String date;

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool completed = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => setState(() => completed = !completed),
        leading: const CircleAvatar(),
        title: Text(widget.title),
        subtitle: Text('Date: ${widget.date}'),
        trailing: !completed
            ? const Icon(Icons.check_box_outline_blank)
            : const Icon(Icons.check_box),
      ),
    );
  }
}
