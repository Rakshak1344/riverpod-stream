import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpodstream/config/hive/hive_box.dart';
import 'package:riverpodstream/data/models/task_model.dart';
import 'package:collection/collection.dart';

part 'local_task_repository.g.dart';

@riverpod
LocalTaskRepository localTaskRepository(LocalTaskRepositoryRef ref) =>
    LocalTaskRepository(ref);

class LocalTaskRepository {
  LocalTaskRepository(this.ref);

  final LocalTaskRepositoryRef ref;

  final StreamController<List<Task>> _controller =
      StreamController<List<Task>>();

  late final Box<Task> box = Hive.box<Task>(HiveBox.tasks);

  Stream<List<Task>> watchAllTasks() {
    box.watch().listen((_) => _addTasksToStream());
    _addTasksToStream();

    return _controller.stream;
  }

  void _addTasksToStream() {
    var tasks = box.values.toList();

    _controller.add(tasks);
  }

  Stream<Task?> watchTask(int id) {
    return _controller.stream.transform(
      StreamTransformer<List<Task>, Task?>.fromHandlers(
        handleData: (List<Task> data, EventSink<Task?> sink) {
          var taskById = data.firstWhereOrNull((Task task) => task.id == id);

          sink.add(taskById);
        },
      ),
    );
  }

  void saveTasks(List<Task> tasks) async {
    var taskIdMap = <int, Task>{};

    for (var task in tasks) {
      taskIdMap[task.id] = task;
    }

    await box.putAll(taskIdMap);
  }

  void removeTask(int id) {
    box.delete(id);
  }

  void deleteAllTasks() {
    box.clear();
  }
}
