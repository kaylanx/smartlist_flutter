import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/tasks_model.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';

void main() {
  runApp(SmartListApp());
}

class SmartListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TasksModel(),
      child: MaterialApp(
        theme: Theme.of(context).copyWith(
          primaryColor: Colors.deepPurple,
        ),
        home: TasksScreen(),
      ),
    );
  }
}
