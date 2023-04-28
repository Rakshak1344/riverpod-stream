import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpodstream/data/models/task_model.dart';
import 'package:riverpodstream/data/repositories/local_task_repository.dart';
import 'package:riverpodstream/data/repositories/network_task_repository.dart';

part 'task_service.g.dart';

@riverpod
TaskService taskService(TaskServiceRef ref) {
  return TaskService(ref);
}

class TaskService {
  final TaskServiceRef ref;
  final LocalTaskRepository _localTaskRepository;
  final NetworkTaskRepository _networkTaskRepository;

  TaskService(this.ref)
      : _localTaskRepository = ref.read(localTaskRepositoryProvider),
        _networkTaskRepository = ref.read(networkTaskRepositoryProvider);

  Stream<List<Task>> watchAllTasks() {
    refreshTasks();

    return _localTaskRepository.getAllTasks();
  }

  Stream<Task?> watchTaskById(int id) async* {
    var res = await _networkTaskRepository.fetchTaskById(id);
    _localTaskRepository.saveTasks([res.data]);

    yield* _localTaskRepository.getTaskById(id);
  }

  void deleteTask(int id) {
    _localTaskRepository.removeTask(id);
  }

  void refreshTasks() async {
    var res = await _networkTaskRepository.fetchTasks();
    _localTaskRepository.saveTasks(res.data);
  }
}
