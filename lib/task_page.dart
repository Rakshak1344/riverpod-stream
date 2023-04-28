import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodstream/data/models/task_model.dart';
import 'package:riverpodstream/data/state/task_state.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildTitle(),
        actions: [buildDeleteAllButton()],
      ),
      body: buildBody(),
      floatingActionButton: buildAddTaskFloatingActionButton(),
    );
  }

  Widget buildTitle() {
    return ref.watch(tasksStateProvider).when(
        data: (data) {
          return Text(data.length.toString());
        },
        error: (e, s) => Text(e.toString()),
        loading: () => const Text("Loading"));
  }

  Widget buildAddTaskFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () => ref.read(tasksStateProvider.notifier).fetchTasks(),
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }

  Widget buildBody() {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ref.watch(tasksStateProvider).when(
            data: buildTaskList,
            loading: () => const CircularProgressIndicator(),
            error: (e, s) => Text(e.toString()),
          ),
    );
  }

  Future<void> onRefresh() async {
    ref.read(tasksStateProvider.notifier).fetchTasks();
  }

  Widget buildTaskList(List<Task> tasks) {
    log(tasks.toString());

    return Center(
      child: Visibility(
        visible: tasks.isNotEmpty,
        replacement: const Text("No tasks"),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, i) => buildListTile(tasks[i]),
        ),
      ),
    );
  }

  Widget buildListTile(Task? task) {
    return Visibility(
      visible: task != null,
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          if (DismissDirection.endToStart == direction) {
            ref.read(tasksStateProvider.notifier).deleteTask(task.id);
          }
        },
        child: ListTile(
          title: Text(task!.title),
          subtitle: Text(task.completed.toString()),
        ),
      ),
    );
  }

  Widget buildDeleteAllButton() {
    return CloseButton(
      onPressed: () => ref.read(tasksStateProvider.notifier).deleteAllTasks(),
    );
  }
}
