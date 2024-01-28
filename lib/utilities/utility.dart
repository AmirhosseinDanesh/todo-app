import 'package:notepad/data/model/task-type-enum.dart';
import 'package:notepad/data/model/task-type.dart';

List<TaskType> getTaskTypeList() {
  var list = [
    TaskType(
      image: "images/workout.png",
      title: "ورزش کردن",
      TaskTypeEnum: TaskTypeEnum.workout,
    ),
    TaskType(
      image: "images/hard_working.png",
      title: "کار کردن",
      TaskTypeEnum: TaskTypeEnum.hardWorking,
    ),
    TaskType(
      image: "images/meditate.png",
      title: "استراحت کردن",
      TaskTypeEnum: TaskTypeEnum.meditate,
    ),
    TaskType(
      image: "images/social_frends.png",
      title: "میتینگ",
      TaskTypeEnum: TaskTypeEnum.meeting,
    ),
    TaskType(
      image: "images/work_meeting.png",
      title: "قرار کاری",
      TaskTypeEnum: TaskTypeEnum.dating,
    ),
  ];
  return list;
}
