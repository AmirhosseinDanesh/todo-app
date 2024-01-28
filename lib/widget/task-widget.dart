import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:notepad/data/constants/color-constants.dart';
import 'package:notepad/screens/edit-task-screen.dart';
import 'package:notepad/data/model/task.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({super.key, required this.task});
  Task task;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isTaskDone = false;

  @override
  void initState() {
    super.initState();
    isTaskDone = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return getTaskItem();
  }

  Widget getTaskItem() {
    return Container(
      height: 132,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: getMainContent(),
      ),
    );
  }

  Row getMainContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.scale(
                    scale: 1.2,
                    child: Checkbox(
                        value: isTaskDone,
                        checkColor: whiteColor,
                        activeColor: greenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        onChanged: (isChecked) {
                          setState(() {
                            isTaskDone = !isTaskDone;
                            widget.task.isDone = isTaskDone;
                            widget.task.save();
                          });
                        }),
                  ),
                  Text(widget.task.title),
                ],
              ),
              Text(
                widget.task.subTitle,
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
              getTimeAndEditBadge(),
            ],
          ),
        ),
        SizedBox(width: 20),
        Image.asset(widget.task.taskType.image),
      ],
    );
  }

  Row getTimeAndEditBadge() {
    return Row(
      children: [
        Container(
          width: 90,
          height: 28,
          decoration: BoxDecoration(
            color: greenColor,
            borderRadius: BorderRadius.all(Radius.circular(18)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: Row(
              children: [
                Text(
                  "${widget.task.time.hour}:${getMinUnderTen(widget.task.time)}",
                  style: TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 10),
                Image.asset("images/icon_time.png"),
              ],
            ),
          ),
        ),
        SizedBox(width: 10),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditTaskScreen(
                  task: widget.task,
                ),
              ),
            );
          },
          child: Container(
            width: 95,
            height: 28,
            decoration: BoxDecoration(
              color: lightGreenColor,
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 12),
              child: Row(
                children: [
                  Text(
                    "ویرایش",
                    style: TextStyle(color: greenColor),
                  ),
                  SizedBox(width: 10),
                  Image.asset("images/icon_edit.png"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  String getMinUnderTen(DateTime time) {
    if (time.minute < 10) {
      return "0${time.minute}";
    } else {
      return "${time.minute}";
    }
  }
}
