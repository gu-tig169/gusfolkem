import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './model.dart';

const API_URL = "https://todoapp-api-vldfm.ondigitalocean.app";
const API_KEY = "01c6dee2-add0-4e8b-8417-2fcb40f51e1f";

class Api {
  static Future addItem(TodoItem item) async {
    var json = jsonEncode(TodoItem.toJson(item));
    await http.post("$API_URL/todos?key=$API_KEY",
        body: json, headers: {"Content-Type": "application/json"});
    print("done");
  }

  static Future<List<TodoItem>> getItems() async {
    var response = await http.get("$API_URL/todos?key=$API_KEY");
    print(response.body);
    var json = jsonDecode(response.body);

    return json.map<TodoItem>((data) {
      return TodoItem.fromJson(data);
    }).toList();
  }

  static Future deleteItem(TodoItem item) async {
    await http.delete("$API_URL/todos/${item.id}?key=$API_KEY");
  }

  static Future updateCheck(TodoItem item) async {
    var json = jsonEncode(TodoItem.toJson(item));
    String itemId = item.id;
    print(json);
    await http.put("$API_URL/todos/$itemId?key=$API_KEY",
        body: json, headers: {"Content-Type": "application/json"});
  }
} //class api
