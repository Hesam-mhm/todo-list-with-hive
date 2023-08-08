part of 'hive_bloc.dart';

class HiveState {
  CreateTaskStatus? createTaskStatus;
  ReadTaskStatus? readTaskStatus;
  ReadAllTaskStatus? readAllTaskStatus;
  UpdateTaskStatus? updateTaskStatus;
  DeleteTaskStatus? deleteTaskStatus;
DeleteAllTaskStatus?deleteAllTaskStatus ;
  HiveState({
    required this.createTaskStatus,
    required this.readTaskStatus,
    required this.readAllTaskStatus,
    required this.updateTaskStatus,
    required this.deleteTaskStatus,
    required this.deleteAllTaskStatus
  });

  HiveState copyWith(
      {CreateTaskStatus? newCreateTaskStatus,
      ReadTaskStatus? newReadTaskStatus,
      ReadAllTaskStatus? newReadAllTaskStatus,
      UpdateTaskStatus? newUpdateTaskStatus,
      DeleteTaskStatus? newDeleteTaskStatus,
      DeleteAllTaskStatus ? newDeleteAllTaskStatus
      }) {
    return HiveState(
        createTaskStatus: newCreateTaskStatus ?? createTaskStatus,
        readTaskStatus: newReadTaskStatus ?? readTaskStatus,
        readAllTaskStatus: newReadAllTaskStatus ?? readAllTaskStatus,
        updateTaskStatus: newUpdateTaskStatus ?? updateTaskStatus,
        deleteTaskStatus: newDeleteTaskStatus ?? deleteTaskStatus,
        deleteAllTaskStatus: newDeleteAllTaskStatus?? deleteAllTaskStatus
        );
  }
}
