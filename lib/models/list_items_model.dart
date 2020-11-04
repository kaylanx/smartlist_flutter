import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:smartlist_flutter/models/list_item.dart';

class ListItemsModel with ChangeNotifier {
  List<ListItem> _listItems
  = [];
  // = List.generate(20, (index) => ListItem(name: 'Shopping List Item ${index+1}'));

  UnmodifiableListView<ListItem> get listItems => UnmodifiableListView(_listItems);

  int get listItemsCount => _listItems.length;

  void addListItem(ListItem listItem) {
    _listItems.add(listItem);
    notifyListeners();
  }

  void toggleListItemDone(ListItem listItem) {
    listItem.toggleDone();
    notifyListeners();
  }

  void removeListItem(ListItem listItem) {
    _listItems.remove(listItem);
    notifyListeners();
  }
}
