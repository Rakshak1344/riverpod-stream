import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodstream/config/app_config.dart';
import 'package:riverpodstream/data/repositories/fake_task_repository.dart';
import 'package:riverpodstream/data/repositories/network_task_repository.dart';

import 'package:riverpodstream/task_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.initHive();

  runApp(
    const ProviderScope(
      // overrides: [
      //   networkTaskRepositoryProvider
      //       .overrideWith((ref) => FakeTaskRepository(),),
      // ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
