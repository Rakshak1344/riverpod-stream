import 'package:riverpodstream/config/response/response.dart';
import 'package:riverpodstream/data/fixtures/task_fixtures.dart';
import 'package:riverpodstream/data/models/task_model.dart';
import 'package:riverpodstream/data/repositories/network_task_repository.dart';

class FakeTaskRepository implements NetworkTaskRepository {
  @override
  Future<List<Task>> fetchTasks() async {
    var task = TaskFixture.factory().makeMany(2);
    return task;
  }

  @override
  Future<ObjectResponse<Task>> fetchTaskById(int id) async {
    var task = TaskFixture.factory().makeSingle();
    return ObjectResponse<Task>(task);
  }
}
