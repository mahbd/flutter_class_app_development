import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    Key? key,
    required this.title,
    required this.date,
    required this.onDelete,
  }) : super(key: key);

  final String title;
  final String date;
  final void Function() onDelete;

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool completed = false;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        key: widget.key,
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {}),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (BuildContext context) => {widget.onDelete()},
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (_) => setState(() => completed = !completed),
            backgroundColor: completed
                ? const Color(0xFF21B7CA)
                : const Color.fromARGB(255, 14, 240, 6),
            foregroundColor: Colors.white,
            icon: Icons.check,
            label: completed ? 'Undo' : 'Done',
          ),
        ],
      ),
      child: Card(
        child: ListTile(
          onTap: () => setState(() => completed = !completed),
          leading: const CircleAvatar(),
          title: Text(widget.title),
          subtitle: Text('Date: ${widget.date}'),
          trailing: !completed
              ? const Icon(Icons.check_box_outline_blank)
              : const Icon(Icons.check_box),
        ),
      ),
    );
  }
}
