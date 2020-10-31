class Task {
  final String name;
  bool _isDone = false;
  bool get isDone => _isDone;

  Task({this.name});

  void toggleDone() {
    _isDone = !_isDone;
  }
}