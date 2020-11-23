import 'package:flutter/material.dart';

class TodoItem {
  String text;
  bool check;

  TodoItem({this.text, this.check = false});
} //TodoItem, creates a TodoItem.

class MyState extends ChangeNotifier {
  List<TodoItem> _list = [];

  List<TodoItem> get list => _list;

  void addItem(TodoItem item) {
    _list.add(item);
    notifyListeners();
  }

  void removeItem(TodoItem item) {
    _list.remove(item);
    notifyListeners();
  }

  void setCheck(TodoItem item, bool check) {
    item.check = check;
    notifyListeners();
  }

  /*List<TodoItem> filteredList(String choice) {
    if (choice == "done") {
      return _list.
    } */

} //MyState
