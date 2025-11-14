import 'package:flutter/widgets.dart';

class TodolistProvider extends ChangeNotifier {
  // final todotextcontroller = TextEditingController();

  List<Map<String, dynamic>> tododate = [
    {"task": "helo", "isCheck": false},
  ];

  void toggleCkeckbox(int index) {
    tododate[index]["isCheck"] = !tododate[index]["isCheck"];
    notifyListeners();
  }

  void addtodolistitem(String title) {
    if (title.isNotEmpty) {
      tododate.add({"task": title.trim(), "isCheck": false});
      notifyListeners();
    }

    notifyListeners();
  }

  void delecttodolistitem(int index) {
    tododate.removeAt(index);
    notifyListeners();
  }

  void updateTodo(int index, String newVal) {
    tododate[index]["task"] = newVal;
    notifyListeners();
  }
}
