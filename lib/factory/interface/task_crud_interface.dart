import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/data/task_data.dart';
import 'package:todo_app/database/app_database.dart';

abstract class TaskCrudInterface {
  Future<List<TaskData>> fetchList(AppDatabase db, AccountData account);
  Future<TaskData> fetchItem(AppDatabase db, int id);
  Future<TaskData> create(AppDatabase db, DbTaskTableCompanion companion);
  Future<TaskData> update(
      AppDatabase db, int id, DbTaskTableCompanion companion);
  Future delete(AppDatabase db, int id);
}
