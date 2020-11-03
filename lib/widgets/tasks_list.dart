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
            return Dismissible(
              key: Key(currentTask.name),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    deleteLabel(),
                  ],
                ),
              ),
              onDismissed: (direction) {
                taskModel.removeTask(currentTask);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${currentTask.name} removed')));
              },
              child: TaskTile(
                taskTitle: currentTask.name,
                isChecked: currentTask.isDone,
                onCheckboxToggled: (bool checkboxState) {
                  taskModel.toggleTaskDone(currentTask);
                },
                onLongPress: () {
                  taskModel.removeTask(currentTask);
                },
              ),
            );
          },
        ).build(context);
      },
    );
  }

  Widget deleteLabel() => Text(
        'Delete',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      );
}
