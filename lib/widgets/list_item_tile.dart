import 'package:flutter/material.dart';

class ListItemTile extends StatelessWidget {
  final bool isChecked;
  final String listItemTitle;
  final ValueChanged<bool> onCheckboxToggled;
  final GestureLongPressCallback onLongPress;

  const ListItemTile({
    this.isChecked,
    this.listItemTitle,
    this.onCheckboxToggled,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      onTap: () {
        onCheckboxToggled(isChecked);
      },
      leading: Text(
        listItemTitle,
        style: TextStyle(
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
      trailing: Checkbox(
        activeColor: Theme.of(context).primaryColor,
        value: isChecked,
        onChanged: onCheckboxToggled,
      ),
    );
  }
}
