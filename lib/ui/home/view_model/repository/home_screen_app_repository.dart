import 'package:drift/drift.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/data/task_data.dart';
import 'package:todo_app/database/app_database.dart';
import 'package:todo_app/factory/account_factory.dart';
import 'package:todo_app/factory/task_factory.dart';
import 'package:todo_app/repository/home_screen_repository.dart';

class HomeScreenAppRepository extends HomeScreenRepository {
  @override
  Future<List<AccountData>> fetchAccounts() async {
    final db = AppDatabase();
    return AccountFactory().fetchList(db);
  }

  @override
  Future<List<TaskData>> fetchTasks(AccountData account) {
    final db = AppDatabase();
    return TaskFactory().fetchList(db, account);
  }

  @override
  Future<TaskData> updateStatus(TaskData task, DateTime? completedAt) async {
    final db = AppDatabase();
    return await TaskFactory().update(
        db, task.id, DbTaskTableCompanion(completedAt: Value(completedAt)));
  }

  @override
  Future deleteTask(TaskData task) async {
    final db = AppDatabase();
    await TaskFactory().delete(db, task.id);
  }
}