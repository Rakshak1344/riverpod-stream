import 'package:riverpodstream/config/response/response.dart';
import 'package:riverpodstream/data/fixtures/task_fixtures.dart';
import 'package:riverpodstream/data/models/task_model.dart';
import 'package:riverpodstream/data/repositories/network_task_repository.dart';

class FakeTaskRepository implements NetworkTaskRepository {
  @override
  Future<CollectionResponse<Task>> fetchTasks() async {
    var task = TaskFixture.factory().makeMany(2);
    return CollectionResponse<Task>(task);
  }

  @override
  Future<ObjectResponse<Task>> fetchTaskById(int id) async {
    var task = TaskFixture.factory().makeSingle();
    return ObjectResponse<Task>(task);
  }
}
