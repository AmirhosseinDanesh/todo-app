import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:notepad/data/constants/color-constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightgreyColor,
      body: Center(
        child: getTaskItem(),
      ),
    );
  }

  Container getTaskItem() {
    return Container(
      height: 132,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
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
                  MSHCheckbox(
                    size: 32,
                    value: isChecked,
                    colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                      checkedColor: greenColor,
                    ),
                    style: MSHCheckboxStyle.fillScaleColor,
                    onChanged: (selected) {
                      setState(
                        () {
                          isChecked = selected;
                        },
                      );
                    },
                  ),
                  Text("ورزش کردن"),
                ],
              ),
              Text("dsf"),
              Spacer(),
              getTimeAndEditBadge(),
            ],
          ),
        ),
        SizedBox(width: 20),
        Image.asset("images/workout.png"),
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
                  "10:30",
                  style: TextStyle(color: whiteColor),
                ),
                SizedBox(width: 10),
                Image.asset("images/icon_time.png"),
              ],
            ),
          ),
        ),
        SizedBox(width: 10),
        Container(
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
      ],
    );
  }
}
