import 'package:drift/drift.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/data/project_data.dart';
import 'package:todo_app/database/app_database.dart';
import 'package:todo_app/factory/project_factory.dart';
import 'package:todo_app/repository/project_screen_repository.dart';

class ProjectScreenAppRepository extends ProjectScreenRepository {
  @override
  Future<ProjectData> create(AccountData account, String name,
      DateTime createdAt, DateTime deadline, DateTime? completedAt) async {
    final db = AppDatabase();
    return await ProjectFactory().create(
        db,
        DbProjectTableCompanion(
            account: Value(account.id),
            name: Value(name),
            createdAt: Value(createdAt),
            deadline: Value(deadline),
            completedAt: Value(completedAt)));
  }

  @override
  Future<ProjectData> update(
      ProjectData project,
      AccountData account,
      String name,
      DateTime createdAt,
      DateTime deadline,
      DateTime? completedAt) async {
    final db = AppDatabase();
    return await ProjectFactory().update(
        db,
        project.id,
        DbProjectTableCompanion(
            account: Value(account.id),
            name: Value(name),
            createdAt: Value(createdAt),
            deadline: Value(deadline),
            completedAt: Value(completedAt)));
  }
}
