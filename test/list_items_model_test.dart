import 'package:flutter_test/flutter_test.dart';
import 'package:smartlist_flutter/models/list_item.dart';
import 'package:smartlist_flutter/models/list_items_model.dart';

void main() {

  test('List Items are initially empty', () {
    final listItemsModel = ListItemsModel();
    expect(listItemsModel.listItemsCount,0);
    expect(listItemsModel.listItems.length,0);
  });

  test('List Items are added correctly', () {
    final listItemsModel = ListItemsModel();
    listItemsModel.addListItem(ListItem(name: 'Added listItem'));

    expect(listItemsModel.listItemsCount,1);
    expect(listItemsModel.listItems.length,1);

    final addedlistItem = listItemsModel.listItems.first;
    expect(addedlistItem.name, 'Added listItem');
    expect(addedlistItem.isDone, false);
  });

  test('List Items are toggled on', () {
    final listItemsModel = ListItemsModel();
    final listItemToToggle = ListItem(name: 'listItem');
    listItemsModel.addListItem(listItemToToggle);
    expect(listItemToToggle.isDone, false);
    listItemsModel.toggleListItemDone(listItemToToggle);
    expect(listItemToToggle.isDone, true);
  });

  test('List Items are toggled on then off', () {
    final listItemsModel = ListItemsModel();
    final listItemToToggle = ListItem(name: 'listItem');
    listItemsModel.addListItem(listItemToToggle);
    expect(listItemToToggle.isDone, false);
    listItemsModel.toggleListItemDone(listItemToToggle);
    expect(listItemToToggle.isDone, true);
    listItemsModel.toggleListItemDone(listItemToToggle);
    expect(listItemToToggle.isDone, false);
  });

  test('List Items are removed', () {
    final listItemsModel = ListItemsModel();
    final listItemToRemove = ListItem(name: 'listItem');
    listItemsModel.addListItem(listItemToRemove);

    expect(listItemsModel.listItemsCount,1);
    expect(listItemsModel.listItems.length,1);

    listItemsModel.removeListItem(listItemToRemove);
    expect(listItemsModel.listItemsCount,0);
    expect(listItemsModel.listItems.length,0);
  });
}
