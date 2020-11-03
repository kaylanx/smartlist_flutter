import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/list_item.dart';
import 'package:todoey_flutter/models/list_items_model.dart';
import 'package:todoey_flutter/widgets/rounded_button.dart';

class AddListItemScreen extends StatefulWidget {
  @override
  _AddListItemScreenState createState() => _AddListItemScreenState();
}

class _AddListItemScreenState extends State<AddListItemScreen> {

  String text;

  @override
  Widget build(BuildContext context) {

    final buttonEnabled = (text != null && text.isNotEmpty);
    final primaryColor = Theme.of(context).primaryColor;
    final disabledColor = Theme.of(context).disabledColor;

    final Function onAddPressed = () {
      context.read<ListItemsModel>().addListItem(ListItem(name: text));
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
              'Add Item',
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


