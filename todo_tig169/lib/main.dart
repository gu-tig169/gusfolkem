import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _list(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SecondView()));
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

  Widget _list() {
    var names = [
      "Write a book",
      "Do homework",
      "Tidy room",
      "Nap",
    ];
    var list = List.generate(names.length, (index) => names[index % 3]);

    return ListView.builder(
      itemBuilder: (context, index) => _todoItem(list[index]),
      itemCount: names.length,
    );
  } //_list returns a builder that build a list from _todoItem.

  Widget _todoItem(text) {
    bool checkBox = false;
    return ListTile(
      leading: Checkbox(value: checkBox, onChanged: (bool newValue) {}),
      title: Text(text),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {},
        hoverColor: Colors.purple,
      ),
    );
  } //_todoItem
} //close for MainView, the todo list.

class Constants {
  static const String All = "all";
  static const String Done = "done";
  static const String UnDone = "undone";

  static const List<String> choices = <String>[All, Done, UnDone];
} //constants for the popupmenu

class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: _appBarDecoration(),
          title: Text("TIG169 TODO"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(children: [
            Container(height: 30),
            _inputField(),
            _addButton(),
          ]),
        ));
  } //builder for the second view.

  Widget _appBarDecoration() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/purple_sky.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  } //_appBarDecoration, decorates the appbar with an image.

  Widget _inputField() {
    return Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Theme(
          data: ThemeData(
            primaryColor: Colors.deepPurpleAccent[100],
            primaryColorDark: Colors.deepPurple,
          ),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurpleAccent)),
              hintText: "What are you going to do?",
            ),
          ),
        ));
  } //_inputField, creates a field where the user can write new things to add to the todo list.

  Widget _addButton() {
    return TextButton(
      onPressed: () {},
      child: _addLabel(),
    );
  } //_addButton, adds a button that add things to the todo list.

  Widget _addLabel() {
    return Container(
      child: Text(
        "+ ADD",
        style: TextStyle(fontSize: 16, color: Colors.deepPurple[300]),
      ),
    );
  } //_addLabel, adds a label with the text "+ ADD".
} //close for SecondView, where the user can add things to the todo list.
