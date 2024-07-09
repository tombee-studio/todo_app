import 'package:todo_app/bases/repository.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/data/task_data.dart';

abstract class HomeScreenRepository extends Repository {
  Future<List<AccountData>> fetchAccounts();
  Future<List<TaskData>> fetchTasks(AccountData account);
  Future<TaskData> updateStatus(TaskData task, DateTime? completedAt);

  Future deleteTask(TaskData task);
}
