class Task {
  final String name;
  bool _isDone;
  bool get isDone => _isDone;

  Task(this.name, this._isDone);

  void toggleDone() {
    _isDone = !_isDone;
  }
}