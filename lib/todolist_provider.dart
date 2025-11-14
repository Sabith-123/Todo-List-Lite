import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodolistProvider extends ChangeNotifier {
  // final todotextcontroller = TextEditingController();

  List<Map<String, dynamic>> tododate = [
    {"task": "helo", "isCheck": false},
  ];

  void loadData() async {
    final sharepref = await SharedPreferences.getInstance();
    final data = sharepref.getString('todo');

    if (data != null) {
      tododate = List<Map<String, dynamic>>.from(jsonDecode(data));
    }
    notifyListeners();
  }

  void saveData() async {
    final sharepref = await SharedPreferences.getInstance();
    sharepref.setString('todo', jsonEncode(tododate));
  }

  void toggleCkeckbox(int index) {
    tododate[index]["isCheck"] = !tododate[index]["isCheck"];
    saveData();
    notifyListeners();
  }

  void addtodolistitem(String title) async {
    if (title.isNotEmpty) {
      tododate.add({"task": title.trim(), "isCheck": false});
      saveData();
      notifyListeners();
    }
  }

  void delecttodolistitem(int index) {
    tododate.removeAt(index);
    saveData();
    notifyListeners();
  }

  void updateTodo(int index, String newVal) {
    tododate[index]["task"] = newVal;
    saveData();
    notifyListeners();
  }
}
