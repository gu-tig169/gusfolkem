import 'package:flutter/material.dart';

class TodoItem {
  String text;
  bool check;

  TodoItem({this.text, this.check = false});
} //TodoItem, creates a TodoItem.

class MyState extends ChangeNotifier {
  List<TodoItem> _list = [];
  String _filterBy = "All";

  List<TodoItem> get list => _list;
  String get filterBy => _filterBy;

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

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
} //MyState
