import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './model.dart';

class TodoList extends StatelessWidget {
  final List<TodoItem> list;

  TodoList(this.list);

  Widget build(BuildContext context) {
    return ListView(
        children: list.map((item) => _item(context, item)).toList());
  }

  Widget _item(context, item) {
    return Card(
        child: Container(
      child: ListTile(
        leading: Checkbox(
          activeColor: Colors.deepPurple,
          value: item.check,
          onChanged: (bool newValue) {
            var state = Provider.of<MyState>(context, listen: false);
            state.setCheck(item, newValue);
          },
        ),
        title: Text(item.text != null ? item.text : "",
            style: item.check
                ? (TextStyle(
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.2),
                    decoration: TextDecoration.lineThrough,
                  ))
                : TextStyle(
                    fontSize: 20,
                    color: Colors.deepPurple,
                  )),
        trailing: IconButton(
            icon: Icon(Icons.clear),
            color: Colors.deepPurple,
            onPressed: () {
              var state = Provider.of<MyState>(context, listen: false);
              state.removeItem(item);
            }),
      ),
    ));
  }
}
