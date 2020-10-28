import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> _tasks = [
    Task('Buy Milk', false),
    Task('Buy Eggs', false),
    Task('Buy Bread', false),
    Task('Buy PS5', false),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        final currentTask = _tasks[index];
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
