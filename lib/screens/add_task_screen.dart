import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function(String) onTaskAdd;

  const AddTaskScreen({@required this.onTaskAdd});

  @override
  Widget build(BuildContext context) {

    String text;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                text = newText;
              },
            ),
            SizedBox(
              height: 25.0,
            ),
            FlatButton(
              onPressed: () {
                onTaskAdd(text);
                Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              height: 50.0,
              color: Colors.lightBlueAccent,
            )
          ],
        ),
      ),
    );
  }
}
