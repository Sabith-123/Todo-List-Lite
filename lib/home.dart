// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_lite/constants.dart';
import 'package:todo_list_lite/custom_widget.dart';
import 'package:todo_list_lite/todolist_provider.dart';

class TodoListLite extends StatelessWidget {
  TodoListLite({super.key});
  final todolistaddcontroller = TextEditingController();
  final todolistaupdatecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final tododate = Provider.of<TodolistProvider>(context).tododate;
    // final addctr = Provider.of<TodolistProvider>(context).todotextcontroller;
    final todoFunc = Provider.of<TodolistProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape: Border(bottom: BorderSide(width: 1, color: borderColors)),
        title: Center(
          child: Text(
            'Todo List Lite',
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Addnewtodo(
                      controller: todolistaddcontroller,
                      label: 'Enter todo',
                    ),
                  ),
                  SizedBox(width: 10),
                  addbuttontodolist(
                    ontap: () {
                      todoFunc.addtodolistitem(todolistaddcontroller.text);
                      todolistaddcontroller.clear();
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: tododate.length,
                  itemBuilder: (context, index) {
                    return TodoTile(
                      checkbox_onchange: (val) {
                        Provider.of<TodolistProvider>(
                          context,
                          listen: false,
                        ).toggleCkeckbox(index);
                      },
                      checkboxvalueTRFA: tododate[index]["isCheck"],
                      tododetailstext: tododate[index]["task"],
                      deleteontap: () {
                        Provider.of<TodolistProvider>(
                          context,
                          listen: false,
                        ).delecttodolistitem(index);
                      },
                      editontap: () {
                        showDialog(
                          context: context,
                          builder: (context) => CustomAlertDialog(
                            onPressed: () {
                              Provider.of<TodolistProvider>(
                                context,
                                listen: false,
                              ).updateTodo(
                                index,
                                todolistaupdatecontroller.text.trim(),
                              );
                              Navigator.pop(context);
                            },
                            title: "Update task",
                            updateCtr: todolistaupdatecontroller,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
