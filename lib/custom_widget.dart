import 'package:flutter/material.dart';
import 'package:todo_list_lite/constants.dart';

class Addnewtodo extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  Addnewtodo({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,

        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: borderColors, width: 2),
        ),
      ),
    );
  }
}

class addbuttontodolist extends StatelessWidget {
  final Function()? ontap;
  addbuttontodolist({super.key, required this.ontap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 50,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: buttoncolo,
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class TodoTile extends StatelessWidget {
  final String? tododetailstext;
  final bool? checkboxvalueTRFA;

  final Function()? deleteontap;
  final Function()? editontap;
  final Function(bool?)? checkbox_onchange;

  TodoTile({
    super.key,
    this.checkboxvalueTRFA = false,
    required this.checkbox_onchange,
    required this.tododetailstext,
    required this.deleteontap,
    required this.editontap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: borderColors),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Checkbox(
              activeColor: buttoncolo,
              value: checkboxvalueTRFA,
              onChanged: checkbox_onchange,
            ),
            SizedBox(width: 5),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  tododetailstext!,
                  style: TextStyle(
                    decoration: checkboxvalueTRFA!
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: const Color.fromARGB(226, 0, 0, 0),
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            Column(
              children: [
                InkWell(
                  onTap: deleteontap,
                  child: Icon(
                    Icons.delete_outline_rounded,
                    color: deletebuttonColor,
                    size: 24,
                  ),
                ),
                SizedBox(height: 5),
                InkWell(
                  onTap: editontap,
                  child: Icon(Icons.edit, color: updatepencilColor, size: 24),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAlertDialog extends StatelessWidget {
  Function()? onPressed;
  TextEditingController updateCtr;
  String title;
  CustomAlertDialog({
    super.key,
    required this.onPressed,
    required this.title,
    required this.updateCtr,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Addnewtodo(controller: updateCtr, label: "update todo"),
      title: Text(title),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        ),
        TextButton(onPressed: onPressed, child: Text("Ok")),
      ],
    );
  }
}
