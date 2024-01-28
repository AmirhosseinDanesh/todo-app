import 'package:hive_flutter/hive_flutter.dart';
import 'package:notepad/data/model/task-type-enum.dart';

part 'task-type.g.dart';

@HiveType(typeId: 2)
class TaskType {
  @HiveField(0)
  String image;

  @HiveField(1)
  String title;

  @HiveField(2)
  Enum TaskTypeEnum;

  TaskType({
    required this.image,
    required this.title,
    required this.TaskTypeEnum,
  });
}
