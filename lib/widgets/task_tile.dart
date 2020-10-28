import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final ValueChanged<bool> onCheckboxToggled;

  const TaskTile({
    this.isChecked,
    this.taskTitle,
    this.onCheckboxToggled,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        taskTitle,
        style: TextStyle(
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: onCheckboxToggled,
      ),
    );
  }
}