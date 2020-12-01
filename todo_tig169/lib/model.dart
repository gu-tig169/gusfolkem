import 'package:flutter/material.dart';

import './APICommunicator.dart';

class TodoItem {
  String text;
  bool check;
  String id;

  TodoItem({this.text, this.check = false, this.id});

  static Map<String, dynamic> toJson(TodoItem item) {
    return {
      "title": item.text,
      "done": item.check,
    };
  }

  static TodoItem fromJson(Map<String, dynamic> json) {
    return TodoItem(
      id: json["id"],
      text: json["title"],
      check: json["done"],
    );
  }
} //TodoItem, creates a TodoItem.

class MyState extends ChangeNotifier {
  List<TodoItem> _list = [];
  String _filterBy = "All";

  List<TodoItem> get list => _list;
  String get filterBy => _filterBy;

  Future getList() async {
    List<TodoItem> list = await Api.getItems();
    _list = list;
    notifyListeners();
  }

  void addItem(TodoItem item) async {
    await Api.addItem(item);
    await getList();
  }

  void removeItem(TodoItem item) async {
    await Api.deleteItem(item);
    await getList();
  }

  void setCheck(TodoItem item, bool check) async {
    item.check = check;
    print(check);
    await Api.updateCheck(item);
    await getList();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
} //MyState
