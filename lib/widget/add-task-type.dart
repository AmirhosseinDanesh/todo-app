import 'package:flutter/material.dart';
import 'package:notepad/data/constants/color-constants.dart';
import 'package:notepad/data/model/task-type.dart';

class taskTypeItemList extends StatelessWidget {
  taskTypeItemList({
    super.key,
    required this.taskType,
    required this.index,
    required this.selectedItemList,
  });

  int index;
  int selectedItemList;

  TaskType taskType;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: (selectedItemList == index) ? greenColor : Colors.grey,
                width: (selectedItemList == index) ? 3 : 1),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        width: 130,
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            Image.asset(taskType.image),
            Text(taskType.title),
          ],
        ));
  }
}
