import 'package:flutter/material.dart';

import './model.dart';

class TodoList extends StatelessWidget {
  final List<TodoItem> list;

  TodoList(this.list);

  Widget build(BuildContext context) {
    return ListView(children: list.map((item) => _item(item)).toList());
  }

  Widget _item(item) {
    return ListTile(
      leading: Checkbox(
        activeColor: Colors.deepPurple,
        value: false,
        onChanged: (val) {},
      ),
      title: Text(
        item.text,
        style: TextStyle(fontSize: 20, color: Colors.deepPurple),
      ),
      trailing: IconButton(
          icon: Icon(Icons.clear), color: Colors.deepPurple, onPressed: () {}),
    );
  }
}
