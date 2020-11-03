import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/list_items_model.dart';
import 'package:todoey_flutter/screens/list_items_screen.dart';

void main() {
  runApp(SmartListApp());
}

class SmartListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ListItemsModel(),
      child: MaterialApp(
        theme: Theme.of(context).copyWith(
          primaryColor: Colors.deepPurple,
          disabledColor: Colors.deepPurple[100],
        ),
        home: ListItemsScreen(),
      ),
    );
  }
}
