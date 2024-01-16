import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notepad/add-task-screen.dart';
import 'package:notepad/home-screen.dart';

void main() async {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "SM",
      ),
      home: AddTaskScreen(),
    );
  }
}
