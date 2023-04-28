import 'dart:async';

import 'package:riverpodstream/data/models/task_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpodstream/data/service/task_service.dart';

part 'task_state.g.dart';

@riverpod
class TasksState extends _$TasksState {
  @override
  Stream<List<Task>> build() {
    return ref.watch(taskServiceProvider).watchAllTasks();
  }

  void fetchTasks() async {
    state = const AsyncValue<List<Task>>.loading();
    ref.read(taskServiceProvider).refreshTasks();
  }
}
