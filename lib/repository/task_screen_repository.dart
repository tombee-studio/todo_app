import 'package:todo_app/bases/repository.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/data/task_data.dart';

abstract class TaskScreenRepository implements Repository {
  Future<TaskData> create(AccountData account, String name, String description,
      TaskData? parent, DateTime deadline);

  Future<TaskData> update(TaskData task, AccountData account, String name,
      String description, TaskData? parent, DateTime deadline);
}
