import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpodstream/config/network_config.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpodstream/config/response/response.dart';
import 'package:riverpodstream/data/models/task_model.dart';

part 'network_task_repository.g.dart';

@riverpod
NetworkTaskRepository networkTaskRepository(NetworkTaskRepositoryRef ref) {
  return NetworkTaskRepository(ref.read(dioProvider));
}

@RestApi()
abstract class NetworkTaskRepository {
  factory NetworkTaskRepository(Dio dio, {String baseUrl}) =
      _NetworkTaskRepository;

  @GET('/todos')
  Future<List<Task>> fetchTasks();

  @GET('/todos')
  Future<ObjectResponse<Task>> fetchTaskById(@Path('id') int id);
}
