

import 'package:hiveeeee/features/home_feature/data/my_task_entity.dart';

abstract class DBAdaptor {
  ///create
  Future<bool> createTask({required MyTask task});

  ///read
  Future<List<MyTask>?> getAllTask();
  Future<MyTask?> readTask({required int index});

  ///update
  Future<bool> updateTask(
      {required int index , required MyTask? task});

  ///delete
  Future<bool> deleteTask({required int index});
  Future<bool> deleteAllTask() ;
}
