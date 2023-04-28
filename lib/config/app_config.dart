import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpodstream/data/models/task_model.dart';
import 'package:riverpodstream/config/hive/hive_box.dart';

class AppConfig {
  static initHive() async {
    var dir = await getApplicationDocumentsDirectory();

    Hive.init(dir.path);

    Hive.registerAdapter(TaskAdapter());

    await Hive.openBox<Task>(HiveBox.tasks);
  }
}
