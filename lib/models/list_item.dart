class ListItem {
  final String name;
  bool _isDone = false;

  bool get isDone => _isDone;

  ListItem({this.name});

  void toggleDone() {
    _isDone = !_isDone;
  }
}
