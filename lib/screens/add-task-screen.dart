import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notepad/data/constants/color-constants.dart';
import 'package:notepad/data/model/task-type.dart';
import 'package:notepad/data/model/task.dart';
import 'package:notepad/utilities/utility.dart';
import 'package:notepad/widget/add-task-type.dart';
import 'package:time_pickerr/time_pickerr.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  FocusNode myFocusNode1 = FocusNode();
  FocusNode myFocusNode2 = FocusNode();
  final TextEditingController controllerInputTitle = TextEditingController();
  final TextEditingController controllerInputSubTitle = TextEditingController();

  var box = Hive.box<Task>("taskBox");

  DateTime? _time;

  int _selectedTaskTypeItem = 0;
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
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: controllerInputTitle,
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
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: controllerInputSubTitle,
                    maxLines: 2,
                    focusNode: myFocusNode2,
                    decoration: InputDecoration(
                      labelText: "توضیحات تسک",
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
              CustomHourPicker(
                title: "انتخاب زمان",
                elevation: 0,
                positiveButtonText: "تایید",
                positiveButtonStyle: TextStyle(
                  color: greenColor,
                  fontSize: 18,
                ),
                negativeButtonText: "حذف",
                negativeButtonStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 0, 0),
                  fontSize: 18,
                ),
                onPositivePressed: (context, time) {
                  _time = time;
                },
                onNegativePressed: (context) {},
              ),
              Container(
                height: 190,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: getTaskTypeList().length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedTaskTypeItem = index;
                        });
                      },
                      child: taskTypeItemList(
                        taskType: getTaskTypeList()[index],
                        index: index,
                        selectedItemList: _selectedTaskTypeItem,
                      ),
                    );
                  },
                ),
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: greenColor, minimumSize: Size(200, 40)),
                onPressed: () {
                  String inputtitle = controllerInputTitle.text;
                  String inputSubtitle = controllerInputSubTitle.text;

                  addTask(inputtitle, inputSubtitle);

                  Navigator.of(context).pop();
                },
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

  addTask(String inputTitle, String inputSubTitle) {
    var task = Task(
      title: inputTitle,
      subTitle: inputSubTitle,
      time: _time!,
      taskType: getTaskTypeList()[_selectedTaskTypeItem],
    );
    box.add(task);
  }
}
