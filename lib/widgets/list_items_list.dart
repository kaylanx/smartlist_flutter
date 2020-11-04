import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartlist_flutter/models/list_items_model.dart';
import 'package:smartlist_flutter/widgets/list_item_tile.dart';

class ListItemsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListItemsModel>(
      builder: (context, listItemsModel, child) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              final currentListItem = listItemsModel.listItems[index];
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      deleteLabel(),
                    ],
                  ),
                ),
                onDismissed: (direction) {
                  listItemsModel.removeListItem(currentListItem);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${currentListItem.name} removed')));
                },
                child: ListItemTile(
                  listItemTitle: currentListItem.name,
                  isChecked: currentListItem.isDone,
                  onCheckboxToggled: (bool checkboxState) {
                    listItemsModel.toggleListItemDone(currentListItem);
                  },
                  onLongPress: () {
                    listItemsModel.removeListItem(currentListItem);
                  },
                ),
              );
            },
            childCount: listItemsModel.listItemsCount,
          ),
        );
      },
    );
  }

  Widget deleteLabel() => Text(
        'Delete',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      );
}
