import 'package:hiveeeee/features/home_feature/data/my_task_entity.dart';

abstract class ReadTaskStatus {}
class ReadTaskInitial extends ReadTaskStatus {}
class ReadTaskComplete extends ReadTaskStatus{
  int index ;
  MyTask? task ;
  ReadTaskComplete({required this.task,required this.index});
}