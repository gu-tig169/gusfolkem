import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './SecondView.dart';
import './TodoList.dart';
import './model.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[50],
        appBar: AppBar(
          flexibleSpace: _appBarDecoration(),
          title: Text("TIG169 TODO"),
          centerTitle: true,
          actions: [_popupMenuButton(context)],
        ),
        body: Consumer<MyState>(
          builder: (context, state, child) => state.loading
              ? _loadingIndicator()
              : TodoList(_filterList(state.list, state.filterBy)),
        ),
        floatingActionButton: _floatingActionButton(context));
  }

  Widget _appBarDecoration() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/purple_sky.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  } //_appBarDecoration, decorates the appbar with an image

  Widget _popupMenuButton(context) {
    return PopupMenuButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        color: Colors.deepPurple[50],
        onSelected: (value) {
          Provider.of<MyState>(context, listen: false).setFilterBy(value);
        },
        itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("All"),
                textStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                value: "All",
              ),
              PopupMenuItem(
                child: Text("Done"),
                textStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                value: "Done",
              ),
              PopupMenuItem(
                child: Text("Undone"),
                textStyle: TextStyle(fontSize: 16, color: Colors.deepPurple),
                value: "Undone",
              )
            ]);
  } //popupMenuButton

  List<TodoItem> _filterList(_list, filterBy) {
    if (filterBy == "All") return _list;
    if (filterBy == "Done")
      return _list.where((item) => item.check == true).toList();
    if (filterBy == "Undone")
      return _list.where((item) => item.check == false).toList();
    return _list;
  }

  Widget _loadingIndicator() {
    return Center(
      child: SizedBox(
        width: 60,
        height: 60,
        child: CircularProgressIndicator(
          strokeWidth: 10,
          backgroundColor: Colors.white,
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.deepPurple),
        ),
      ),
    );
  }

  Widget _floatingActionButton(context) {
    return FloatingActionButton(
      backgroundColor: Colors.deepPurple,
      child: Icon(Icons.add),
      onPressed: () async {
        var newItem = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SecondView(TodoItem(text: ""))));
        if (newItem != null) {
          Provider.of<MyState>(context, listen: false).addItem(newItem);
        }
      },
    );
  }
} //MainView
