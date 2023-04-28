import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:riverpodstream/data/models/task_model.dart';

extension TaskFixture on Task {
  static _TaskFixtureFactory factory() => _TaskFixtureFactory();
}

class _TaskFixtureFactory extends FixtureFactory<Task> {
  @override
  FixtureDefinition<Task> definition() {
    return define(
      (faker) => Task(
        id: faker.randomGenerator.integer(100),
        name: faker.randomGenerator.string(18),
        description: faker.lorem.sentence(),
        isCompleted: faker.randomGenerator.boolean(),
      ),
    );
  }
}
