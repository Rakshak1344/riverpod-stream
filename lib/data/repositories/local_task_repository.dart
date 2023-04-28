import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpodstream/config/hive/hive_box.dart';
import 'package:riverpodstream/data/models/task_model.dart';

part 'local_task_repository.g.dart';

@riverpod
LocalTaskRepository localTaskRepository(LocalTaskRepositoryRef ref) =>
    LocalTaskRepository(ref);

class LocalTaskRepository {
  LocalTaskRepository(this.ref);

  final LocalTaskRepositoryRef ref;

  final StreamController<List<Task>> _controller =
      StreamController<List<Task>>();

  Stream<List<Task>> getAllTasks() {
    Hive.box<Task>(HiveBox.tasks).watch().listen((_) {
      var tasks = Hive.box<Task>(HiveBox.tasks).values.toList();

      _controller.add(tasks);
    });

    return _controller.stream;
  }

  Stream<Task?> getTaskById(int id) {
    return _controller.stream.transform(
      StreamTransformer<List<Task>, Task?>.fromHandlers(
        handleData: (List<Task> data, EventSink<Task?> sink) {
          var taskById = data.firstWhere((Task task) => task.id == id);

          sink.add(taskById);
        },
      ),
    );
  }

  void saveTasks(List<Task> tasks) async {
    var box = Hive.box<Task>(HiveBox.tasks);

    var taskIdMap = <int, Task>{};

    for (var task in tasks) {
      taskIdMap[task.id] = task;
    }

    await box.putAll(taskIdMap);
  }

  void removeTask(int id) {
    var box = Hive.box<List<Task>>(HiveBox.tasks);
    box.delete(id);
  }
}
