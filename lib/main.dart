import 'package:flutter/material.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        primaryColor: Colors.lightBlueAccent,
      ),
      home: TasksScreen(),
    );
  }
}
