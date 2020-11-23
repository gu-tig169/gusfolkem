import 'package:flutter/material.dart';

class TodoItem {
  String text;

  TodoItem({this.text});
} //TodoItem, creates a TodoItem.

class MyState extends ChangeNotifier {
  List<TodoItem> _list;

  List<TodoItem> get list => _list;

  void addItem(TodoItem item) {
    _list.add(item);
    notifyListeners();
  }
}
