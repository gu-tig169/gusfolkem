import 'package:flutter/material.dart';

import './APICommunicator.dart';

String checkToString(bool check) {
  if (check == false) return "false";
  if (check == true) return "true";
  return "false";
}

bool stringToCheck(String check) {
  if (check == "false") return false;
  if (check == "true") return true;
  return false;
}

class TodoItem {
  String text;
  bool check;
  String id;

  TodoItem({this.text, this.check = false, this.id});

  static Map<String, dynamic> toJson(TodoItem item) {
    return {"title": item.text, "done": checkToString(item.check)};
  }

  static TodoItem fromJson(Map<String, dynamic> json) {
    return TodoItem(
      text: json["title"],
      check: stringToCheck(json["check"]),
    );
  }
} //TodoItem, creates a TodoItem.

class MyState extends ChangeNotifier {
  List<TodoItem> _list = [];
  String _filterBy = "All";

  List<TodoItem> get list => _list;
  String get filterBy => _filterBy;

  String _id = "";
  String get id => _id;

  MyState() {}

  Future getList() async {
    List<TodoItem> list = await Api.getItems();
    _list = list;
    notifyListeners();
  }

  void addItem(TodoItem item) async {
    await Api.addItem(item);
    await getList();
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
