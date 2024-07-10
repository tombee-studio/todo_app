import 'package:drift/drift.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/data/project_data.dart';
import 'package:todo_app/data/task_data.dart';
import 'package:todo_app/database/app_database.dart';
import 'package:todo_app/factory/project_factory.dart';
import 'package:todo_app/factory/task_factory.dart';
import 'package:todo_app/repository/task_screen_repository.dart';

class TaskScreenAppRepository extends TaskScreenRepository {
  @override
  Future<TaskData> create(AccountData account, ProjectData project, String name,
      String description, TaskData? parent, DateTime deadline) async {
    final db = AppDatabase();
    return TaskFactory().create(
        db,
        DbTaskTableCompanion(
            account: Value(account.id),
            name: Value(name),
            description: Value(description),
            project: Value(project.id),
            createdAt: Value(DateTime.now()),
            deadline: Value(deadline)));
  }

  @override
  Future<TaskData> update(
      TaskData task,
      AccountData account,
      ProjectData project,
      String name,
      String description,
      TaskData? parent,
      DateTime deadline) {
    final db = AppDatabase();
    return TaskFactory().update(
        db,
        task.id,
        DbTaskTableCompanion(
            account: Value(account.id),
            name: Value(name),
            description: Value(description),
            project: Value(project.id),
            createdAt: Value(DateTime.now()),
            deadline: Value(deadline)));
  }

  @override
  Future<List<ProjectData>> loadProjects(AccountData account) async {
    final db = AppDatabase();
    return await ProjectFactory().fetchList(db, account);
  }
}
