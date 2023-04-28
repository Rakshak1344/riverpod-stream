// import 'dart:async';
//
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:riverpodstream/data/models/task_model.dart';
// import 'package:riverpodstream/data/state/task_controller.dart';
//
// part 'task_stream.g.dart';
//
// @riverpod
// Stream<List<Task?>> taskList(TaskListRef ref) async* {
//   var controller = ref.read(taskListControllerProvider);
//   var taskList = const [
//     Task(name: 'Task 1', description: 'Description 1', id: 1, isCompleted: false),
//     Task(name: 'Task 2', description: 'Description 2', id: 2, isCompleted: false),
//   ];
//
//   controller.add(taskList);
//   yield* controller.stream;
// }
