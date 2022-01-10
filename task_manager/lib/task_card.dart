import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskCard extends StatefulWidget {
  const TaskCard(
      {Key? key,
      required this.title,
      required this.date,
      required this.completed,
      required this.onDelete,
      required this.markAsCompleted})
      : super(key: key);

  final String title;
  final String date;
  final bool completed;
  final void Function() onDelete;
  final void Function() markAsCompleted;

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
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
            onPressed: (_) => widget.markAsCompleted(),
            backgroundColor: widget.completed
                ? const Color(0xFF21B7CA)
                : const Color.fromARGB(255, 14, 240, 6),
            foregroundColor: Colors.white,
            icon: Icons.check,
            label: widget.completed ? 'Undo' : 'Done',
          ),
        ],
      ),
      child: Card(
        child: ListTile(
          onTap: () => widget.markAsCompleted(),
          leading: const CircleAvatar(),
          title: Text(widget.title),
          subtitle: Text('Date: ${widget.date}'),
          trailing: !widget.completed
              ? const Icon(Icons.check_box_outline_blank)
              : const Icon(Icons.check_box),
        ),
      ),
    );
  }
}
