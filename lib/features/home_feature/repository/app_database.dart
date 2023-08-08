import 'dart:developer';
import 'package:hive/hive.dart';
import 'package:hiveeeee/common/utils/app_strings.dart';
import 'package:hiveeeee/features/home_feature/repository/dbAdaptor.dart';

import '../data/my_task_entity.dart';


class AppDatabase implements DBAdaptor {
  AppDatabase._();

  static final _shared = AppDatabase._();
  factory AppDatabase.instance() => _shared;
  static const String _boxName = "task";

  @override
  Future<bool> createTask({required MyTask task}) async {
    try {
      await Hive.box<MyTask>(AppStrings.boxName).add(task);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  Future<bool> deleteTask({required int index}) async {

    try {
      await Hive.box<MyTask>(AppStrings.boxName).deleteAt(index);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
  @override
  Future<bool> deleteAllTask() async {

    try {
      await Hive.box<MyTask>(AppStrings.boxName).clear();
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  

  @override
  Future<List<MyTask>?> getAllTask() async {
    try {
      List<MyTask>? tasks =  Hive.box<MyTask>(AppStrings.boxName).values.toList();
      return tasks;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<MyTask?> readTask({required int index}) async {
    try {
      MyTask? task =  Hive.box<MyTask>(AppStrings.boxName).getAt(index);
      return task;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<bool> updateTask(
      {required int index,required MyTask? task}) async {
    try {
      //  Hive.box<MyTask>(AppStrings.boxName).deleteAt(index);
      await Hive.box<MyTask>(AppStrings.boxName).putAt(index,task!);
return true ;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
