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
    await Future.delayed(const Duration(seconds: 2));
    ref.read(taskServiceProvider).watchAllTasks();
  }

  void deleteTask(int id) {
    state = const AsyncValue<List<Task>>.loading();
    ref.read(taskServiceProvider).deleteTask(id);
    // ref.watch(taskServiceProvider).watchAllTasks();
  }

  void deleteAllTasks() {
    state = const AsyncValue<List<Task>>.loading();
    ref.read(taskServiceProvider).deleteAllTasks();
  }
}
