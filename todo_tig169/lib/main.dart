import 'package:exercise_ui_02/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './MainView.dart';

void main() {
  var state = MyState();
  runApp(ChangeNotifierProvider(
    create: (context) => state,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}
