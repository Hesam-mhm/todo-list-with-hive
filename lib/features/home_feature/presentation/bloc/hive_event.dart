part of 'hive_bloc.dart';

abstract class HiveEvent{}

class CreateTaskEvent extends HiveEvent {
  MyTask task ;
  CreateTaskEvent({required this.task});
}

class DeleteTaskEvent extends HiveEvent {
  int index ;
  DeleteTaskEvent({required this.index});
}

class ReadTaskEvent extends HiveEvent{
  int index ;
  ReadTaskEvent({required this.index});
}

class UpdateTaskEvent extends HiveEvent {
  int index ;
  MyTask? task ;
  UpdateTaskEvent({required this.index,required this.task});
}

class ReadAllTaskEvent extends HiveEvent {}

class DeleteAllTaskEvent extends HiveEvent {
  DeleteAllTaskEvent();
}