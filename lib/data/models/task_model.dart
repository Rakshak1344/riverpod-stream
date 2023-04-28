import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'task_model.freezed.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
@freezed
class Task with _$Task {
  const factory Task({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) required String description,
    @HiveField(3) required bool isCompleted,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
