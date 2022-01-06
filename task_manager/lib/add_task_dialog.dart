import 'package:flutter/material.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({Key? key, required this.addTask}) : super(key: key);

  final void Function(String title, String date) addTask;

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
            widget.addTask(_titleController.text, _dateController.text),
            _titleController.clear(),
            _dateController.clear(),
            Navigator.pop(context)
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
    );
  }
}
