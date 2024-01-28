import 'package:hive_flutter/hive_flutter.dart';

part 'task-type-enum.g.dart';

@HiveType(typeId: 3)
enum TaskTypeEnum {
  
  @HiveField(0)
  banking,

  @HiveField(1)
  hardWorking,
  
  @HiveField(2)
  meditate,
  
  @HiveField(3)
  meeting,
  
  @HiveField(4)
  dating,

  @HiveField(5)
  workout,
}
