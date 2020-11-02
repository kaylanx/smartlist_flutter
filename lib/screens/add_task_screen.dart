import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/tasks_model.dart';
import 'package:todoey_flutter/widgets/rounded_button.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  String text;

  @override
  Widget build(BuildContext context) {

    final buttonEnabled = (text != null && text.isNotEmpty);
    final primaryColor = Theme.of(context).primaryColor;
    final disabledColor = Theme.of(context).disabledColor;

    final Function onAddPressed = () {
      context.read<TasksModel>().addTask(Task(name: text));
      Navigator.pop(context);
    };

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
                color: primaryColor,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                setState(() {
                  text = newText;
                });
              },
            ),
            SizedBox(
              height: 25.0,
            ),
            RoundedButton(
              color: buttonEnabled ? primaryColor : disabledColor,
              text: 'Add',
              onPressed: buttonEnabled ? onAddPressed : null,
            ),
          ],
        ),
      ),
    );
  }
}


