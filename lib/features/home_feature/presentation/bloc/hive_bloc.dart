import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:hiveeeee/common/utils/app_strings.dart';
import 'package:hiveeeee/features/home_feature/data/my_task_entity.dart';
import 'package:hiveeeee/features/home_feature/presentation/bloc/status/create_task_statu.dart';
import 'package:hiveeeee/features/home_feature/presentation/bloc/status/delete_all_task_status.dart';
import 'package:hiveeeee/features/home_feature/presentation/bloc/status/delete_task_status.dart';
import 'package:hiveeeee/features/home_feature/presentation/bloc/status/read_all_task_status.dart';
import 'package:hiveeeee/features/home_feature/presentation/bloc/status/read_task_status.dart';
import 'package:hiveeeee/features/home_feature/presentation/bloc/status/update_task_status.dart';
import 'package:hiveeeee/features/home_feature/repository/app_database.dart';

part 'hive_state.dart';
part 'hive_event.dart';

class HiveBloc extends Bloc<HiveEvent, HiveState> {
  AppDatabase appDatabase = AppDatabase.instance();
  HiveBloc()
      : super(HiveState(
            createTaskStatus: CreateTaskInitial(),
            readTaskStatus: ReadTaskInitial(),
            readAllTaskStatus: ReadAllTaskInitial(),
            updateTaskStatus: UpdateTaskInitial(),
            deleteTaskStatus: DeleteTaskInitial(),
            deleteAllTaskStatus: DeleteAllTaskInitial())) {



    on<CreateTaskEvent>((event, emit) async {
      bool isCreated = await appDatabase.createTask(task: event.task);
      if (isCreated) {
        List<MyTask>? taskList =  Hive.box<MyTask>(AppStrings.boxName).values.toList() ;
        emit(state.copyWith(newReadAllTaskStatus: ReadAllTaskComplete(taskList: taskList)));
      } 
    });

    on<ReadTaskEvent>((event, emit) async {
      MyTask? task = await appDatabase.readTask(index: event.index);
      emit(state.copyWith(newReadTaskStatus: ReadTaskComplete(index: event.index, task: task)));
    });
    on<ReadAllTaskEvent>((event, emit) async {
      List<MyTask>? taskList = await appDatabase.getAllTask();
      emit(state.copyWith(newReadAllTaskStatus: ReadAllTaskComplete(taskList: taskList)));
    });

    on<UpdateTaskEvent>((event, emit) async {
  
      await appDatabase.updateTask(index: event.index,task: event.task);
            List<MyTask>? taskList = await appDatabase.getAllTask();
      emit(state.copyWith(newReadAllTaskStatus: ReadAllTaskComplete(taskList: taskList)));
    });

    on<DeleteTaskEvent>((event, emit) async {
      bool isDeletet = await appDatabase.deleteTask(index: event.index);
      if (isDeletet) {
           List<MyTask>? taskList =  Hive.box<MyTask>(AppStrings.boxName).values.toList() ;
        emit(state.copyWith(newReadAllTaskStatus: ReadAllTaskComplete(taskList: taskList)));
      }
    });

    on<DeleteAllTaskEvent>((event, emit) async {
      bool isDeletetedAll = await appDatabase.deleteAllTask();
      if (isDeletetedAll) {
        List<MyTask>? taskList =  Hive.box<MyTask>(AppStrings.boxName).values.toList() ;
        emit(state.copyWith(newReadAllTaskStatus: ReadAllTaskComplete(taskList: taskList)));
      }
    });
  }
}
