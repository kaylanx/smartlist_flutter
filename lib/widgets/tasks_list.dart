import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/tasks_model.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksModel>(
      builder: (context, taskModel, child) {
        return ListView.builder(
          itemCount: taskModel.taskCount,
          itemBuilder: (context, index) {
            final currentTask = taskModel.tasks[index];
            return TaskTile(
              taskTitle: currentTask.name,
              isChecked: currentTask.isDone,
              onCheckboxToggled: (bool checkboxState) {
                taskModel.toggleTaskDoneAtIndex(index);
              },
            );
          },
        ).build(context);
      },
    );
  }
}
