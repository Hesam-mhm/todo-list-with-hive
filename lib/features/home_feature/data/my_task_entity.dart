import 'package:hive/hive.dart';
part 'my_task_entity.g.dart';

@HiveType(typeId: 0)
class MyTask extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  bool? isDone;
  @HiveField(2)
  Periority periority;
  MyTask({required this.name, required this.isDone, required this.periority});

  MyTask copyWith({String? newName, bool? newIsDone, Periority? newPeriority}) {
    return MyTask(
        name: newName ?? name,
        isDone: newIsDone ?? isDone,
        periority: newPeriority ?? periority);
  }
}

@HiveType(typeId: 1)
enum Periority {
  @HiveField(0)
  low,
  @HiveField(1)
  normal,
  @HiveField(2)
  high
}
