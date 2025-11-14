import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_lite/splashScreen.dart';
import 'package:todo_list_lite/todolist_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodolistProvider()..loadData(),
        ),
      ],
      child: ToDolIstLite(),
    ),
  );
}

class ToDolIstLite extends StatelessWidget {
  const ToDolIstLite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List Lite',
      home: Splashscreen(),
    );
  }
}
