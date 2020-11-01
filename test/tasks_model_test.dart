import 'package:flutter_test/flutter_test.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/tasks_model.dart';

void main() {

  test('Tasks are initially empty', () {
    final tasksModel = TasksModel();
    expect(tasksModel.taskCount,0);
    expect(tasksModel.tasks.length,0);
  });

  test('Tasks are added correctly', () {
    final tasksModel = TasksModel();
    tasksModel.addTask(Task(name: 'Added Task'));

    expect(tasksModel.taskCount,1);
    expect(tasksModel.tasks.length,1);

    final addedTask = tasksModel.tasks.first;
    expect(addedTask.name, 'Added Task');
    expect(addedTask.isDone, false);
  });

  test('Tasks are toggled on', () {
    final tasksModel = TasksModel();
    final taskToToggle = Task(name: 'Task');
    tasksModel.addTask(taskToToggle);
    expect(taskToToggle.isDone, false);
    tasksModel.toggleTaskDone(taskToToggle);
    expect(taskToToggle.isDone, true);
  });

  test('Tasks are toggled on then off', () {
    final tasksModel = TasksModel();
    final taskToToggle = Task(name: 'Task');
    tasksModel.addTask(taskToToggle);
    expect(taskToToggle.isDone, false);
    tasksModel.toggleTaskDone(taskToToggle);
    expect(taskToToggle.isDone, true);
    tasksModel.toggleTaskDone(taskToToggle);
    expect(taskToToggle.isDone, false);
  });

  test('Tasks are removed', () {
    final tasksModel = TasksModel();
    final taskToRemove = Task(name: 'Task');
    tasksModel.addTask(taskToRemove);

    expect(tasksModel.taskCount,1);
    expect(tasksModel.tasks.length,1);

    tasksModel.removeTask(taskToRemove);
    expect(tasksModel.taskCount,0);
    expect(tasksModel.tasks.length,0);
  });
}
