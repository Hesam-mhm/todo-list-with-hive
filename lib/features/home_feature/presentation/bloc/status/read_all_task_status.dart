import 'package:hiveeeee/features/home_feature/data/my_task_entity.dart';

abstract class ReadAllTaskStatus {}
class ReadAllTaskInitial extends ReadAllTaskStatus {}
class ReadAllTaskComplete extends ReadAllTaskStatus {
  List<MyTask>?taskList ;
  ReadAllTaskComplete({required this.taskList});
}