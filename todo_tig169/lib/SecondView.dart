import 'package:flutter/material.dart';

import './model.dart';

class SecondView extends StatefulWidget {
  final TodoItem item;

  SecondView(this.item);

  @override
  State<StatefulWidget> createState() {
    return SecondViewState(item);
  }
}

class SecondViewState extends State<SecondView> {
  String text;
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  TextEditingController textEditingController;

  SecondViewState(TodoItem item) {
    this.text = item.text;

    textEditingController = TextEditingController(text: item.text);

    textEditingController.addListener(() {
      setState(() {
        text = textEditingController.text;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[50],
        key: _scaffoldkey,
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
        color: Colors.white,
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Theme(
          data: ThemeData(
            primaryColor: Colors.deepPurpleAccent[100],
            primaryColorDark: Colors.deepPurple,
          ),
          child: TextField(
            controller: textEditingController,
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
        onPressed: () {
          if (textEditingController.text.trim().isEmpty) {
            SnackBar snackBar = SnackBar(
                backgroundColor: Colors.deepPurple,
                content:
                    Text("Write something", style: TextStyle(fontSize: 16)));
            _scaffoldkey.currentState.showSnackBar(snackBar);
          } else {
            Navigator.pop(context, TodoItem(text: text));
          }
        },
        child: Container(
          child: Text(
            "+ ADD",
            style: TextStyle(fontSize: 16, color: Colors.deepPurple),
          ),
        ));
  } //_addButton
}
