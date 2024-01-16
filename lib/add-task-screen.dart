import 'package:flutter/material.dart';
import 'package:notepad/data/constants/color-constants.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  FocusNode myFocusNode1 = FocusNode();
  FocusNode myFocusNode2 = FocusNode();
  @override
  void initState() {
    super.initState();

    myFocusNode1.addListener(() {
      setState(() {});
    });
    myFocusNode2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    focusNode: myFocusNode1,
                    decoration: InputDecoration(
                      labelText: "عنوان تسک",
                      labelStyle: TextStyle(
                        fontFamily: "SM",
                        fontSize: 16,
                        color: myFocusNode1.hasFocus ? greenColor : greyColor,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Color(0xffc5c5c5), width: 3),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: greenColor, width: 3),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    maxLines: 2,
                    focusNode: myFocusNode2,
                    decoration: InputDecoration(
                      labelText: "عنوان تسک",
                      labelStyle: TextStyle(
                        fontFamily: "SM",
                        fontSize: 16,
                        color: myFocusNode2.hasFocus ? greenColor : greyColor,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Color(0xffc5c5c5), width: 3),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: greenColor, width: 3),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: greenColor, minimumSize: Size(200, 40)),
                onPressed: () {},
                child: Text(
                  "اضافه کردن تسک",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
