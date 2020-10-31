import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;

  const TasksList({this.tasks});

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        final currentTask = widget.tasks[index];
        return TaskTile(
          taskTitle: currentTask.name,
          isChecked: currentTask.isDone,
          onCheckboxToggled: (bool checkboxState) {
            setState(() {
              currentTask.toggleDone();
            });
          },
        );
      },
    ).build(context);
  }
}
