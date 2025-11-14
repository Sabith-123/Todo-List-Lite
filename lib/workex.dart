import 'package:flutter/material.dart';
import 'package:todo_list_lite/constants.dart';

class Workex extends StatefulWidget {
  const Workex({super.key});

  @override
  State<Workex> createState() => _WorkexState();
}

class _WorkexState extends State<Workex> {
  bool checkboxvalue = false;
  String text1 =
      "khjasgfeduhjwqa kjuhgrfsdfliuwgerkiyhiukdsahg cuyagefujyaet6 rfujqefrqrewtjwhergtvk i wuqytrewqert qweuryqwteuyqwe vrtjuwtwjetyurreweeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeequiea ruweyar qwi7e3rtwqfwgaerukjwgqavkiycgqkueyikuiygwke ewqkuy wqiuytr qwiuyrgtq32uytwauyerfgtaw weuqyrqwiuy4ewq qwue7yrquy3rqweyurquweytrqwfeu7yrq67";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                // width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: borderColors),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: buttoncolo,
                        value: checkboxvalue,
                        onChanged: (val) {
                          setState(() {
                            checkboxvalue = val!;
                            if (val == false) {
                              val = true;
                            } else {
                              val = false;
                            }
                          });
                        },
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(text1),
                        ),
                      ),
                      SizedBox(width: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.delete, size: 24),
                          Icon(Icons.edit),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        focusColor: borderColors,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        label: Text('todo list'),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: Icon(Icons.add_ic_call_outlined),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
