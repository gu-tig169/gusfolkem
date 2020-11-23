import 'package:flutter/material.dart';

import './Constants.dart';
import './SecondView.dart';
import './TodoList.dart';
import './model.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: _appBarDecoration(),
          title: Text("TIG169 TODO"),
          centerTitle: true,
          actions: [
            PopupMenuButton<String>(
                onSelected: choiceAction,
                itemBuilder: (BuildContext context) {
                  return Constants.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                })
          ],
        ),
        body: TodoList([
          TodoItem(text: "Drink tea"),
          TodoItem(text: "Drink more tea"),
          TodoItem(text: "Drink a pot of tea")
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var newItem = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SecondView(TodoItem(text: ""))));
          },
          tooltip: 'Increment',
          backgroundColor: Colors.deepPurple[300],
          child: Icon(Icons.add),
        ));
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

  void choiceAction(String choice) {
    if (choice == Constants.All) {
      print("All");
    }
    if (choice == Constants.Done) {
      print("Done");
    }
    if (choice == Constants.UnDone) {
      print("Undone");
    }
  } //prints in the debug when pressed.
} //MainView
