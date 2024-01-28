import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:notepad/screens/add-task-screen.dart';
import 'package:notepad/data/constants/color-constants.dart';
import 'package:notepad/widget/task-widget.dart';
import 'package:notepad/data/model/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var taskBox = Hive.box<Task>("taskBox");

  bool isFabVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightgreyColor,
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: taskBox.listenable(),
          builder: (context, value, child) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notif) {
                setState(() {
                  if (notif.direction == ScrollDirection.forward) {
                    isFabVisible = true;
                  }
                  if (notif.direction == ScrollDirection.reverse) {
                    isFabVisible = false;
                  }
                });
                return true;
              },
              child: ListView.builder(
                itemCount: taskBox.values.length,
                itemBuilder: ((context, index) {
                  var task = taskBox.values.toList()[index];
                  return getListItem(task);
                }),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Visibility(
        visible: isFabVisible,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddTaskScreen(),
              ),
            );
          },
          backgroundColor: greenColor,
          child: Image.asset("images/icon_add.png"),
        ),
      ),
    );
  }

  Widget getListItem(Task task) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        task.delete();
        // if (direction == DismissDirection.startToEnd) {
        // }
      },
      child: TaskWidget(task: task),
    );
  }
}
