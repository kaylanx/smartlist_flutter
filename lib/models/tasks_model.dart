import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

class TasksModel with ChangeNotifier {

  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount => _tasks.length;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTaskDoneAtIndex(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void removeTaskAtIndex(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

}