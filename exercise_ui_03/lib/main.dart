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
        title: Text("Tig169 TODO"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_right_alt_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondView()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 32),
            _image(),
            _nameLabel(),
            _nameInputField(),
            Container(height: 24),
            _checkBoxRow(),
            _iconRow(),
            Container(height: 24),
            _buttonRow(),
          ],
        ), //Column
      ), //Center
    ); //Scaffold
  }

  Widget _image() {
    return Stack(
      children: [
        Image(image: AssetImage("assets/howls_castle.jpg")),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 101,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(0, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            )),
        Positioned(
            bottom: 10,
            left: 20,
            child: Text("Howls Moving Castle", style: TextStyle(fontSize: 36))),
      ],
    );
  }

  Widget _nameLabel() {
    return Container(
      margin: EdgeInsets.only(left: 16, top: 24),
      child: Text("Name"),
    );
  } //_nameLabel

  Widget _nameInputField() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: TextField(decoration: InputDecoration(hintText: "Your name")),
    );
  } //_nameInputField

  Widget _checkBoxRow() {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (val) {},
        ),
        Text("Contact me"),
      ],
    );
  } //_checkBoxRow

  Widget _iconRow() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 16, right: 20),
          child: Icon(Icons.person),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Heading", style: TextStyle(fontSize: 20)),
            Text("Subheading"),
          ],
        ),
      ],
    );
  } //_iconRow

  Widget _buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlineButton(onPressed: () {}, child: Text("Cancel")),
        Container(width: 30),
        RaisedButton(
          onPressed: () {},
          child: Text("Save"),
          color: Colors.deepPurple[200],
          textColor: Colors.white,
        ),
      ],
    );
  } //_buttonRow
} //MainView

class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tig169 TODO"),
        centerTitle: true,
      ),
      body: _list(),
    );
  } //builder

  Widget _list() {
    var names = ["Pixel", "Lamora"];
    var list = List.generate(25, (index) => "${names[index % 2]} $index");

    return ListView.builder(
      itemBuilder: (context, index) => _item(list[index]),
      itemCount: 25,
    );
  } // _list

  Widget _item(text) {
    return ListTile(
      title: Text(text),
      subtitle: Text("katt"),
    );
  } // _item
} //SecondView
