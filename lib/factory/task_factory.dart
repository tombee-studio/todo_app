import 'package:drift/drift.dart';
import 'package:todo_app/bases/crud_factory.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/data/project_data.dart';
import 'package:todo_app/data/task_data.dart';
import 'package:todo_app/database/app_database.dart';
import 'package:todo_app/factory/interface/task_crud_interface.dart';

class TaskFactory extends CrudFactory<TaskData, DbTaskTableCompanion>
    implements TaskCrudInterface {
  static final TaskFactory _instance = TaskFactory._internal();
  factory TaskFactory() {
    return _instance;
  }
  TaskFactory._internal();

  @override
  Future<TaskData> create(
      AppDatabase db, DbTaskTableCompanion companion) async {
    final id = await db.into(db.dbTaskTable).insert(companion);
    return fetchItem(db, id);
  }

  @override
  Future delete(AppDatabase db, int id) async {
    await (db.delete(db.dbTaskTable)..where((task) => task.id.equals(id))).go();
  }

  @override
  Future<TaskData> fetchItem(AppDatabase db, int id) async {
    final row = await (db.select(db.dbTaskTable)
          ..where((tbl) => tbl.id.equals(id)))
        .join([
      innerJoin(db.dbAccountTable,
          db.dbAccountTable.id.equalsExp(db.dbTaskTable.account)),
      innerJoin(db.dbProjectTable,
          db.dbProjectTable.id.equalsExp(db.dbTaskTable.project))
    ]).getSingle();

    final dbAccount = row.readTable(db.dbAccountTable);
    final dbTask = row.readTable(db.dbTaskTable);
    final dbProject = row.readTable(db.dbProjectTable);
    return TaskData(
        dbTask.id,
        AccountData(dbAccount.id, dbAccount.name, dbAccount.purpose),
        dbTask.name,
        dbTask.description,
        ProjectData(
            dbProject.id,
            AccountData(dbAccount.id, dbAccount.name, dbAccount.purpose),
            dbProject.name,
            dbProject.createdAt,
            dbProject.deadline,
            dbProject.completedAt),
        dbTask.createdAt,
        dbTask.deadline,
        dbTask.completedAt);
  }

  @override
  Future<List<TaskData>> fetchList(AppDatabase db, AccountData account) async {
    final rows = await (db.select(db.dbTaskTable)
          ..where((tbl) => tbl.account.equals(account.id)))
        .join([
      innerJoin(db.dbAccountTable,
          db.dbAccountTable.id.equalsExp(db.dbTaskTable.account))
    ]).get();
    return rows.map((row) {
      final dbAccount = row.readTable(db.dbAccountTable);
      final dbTask = row.readTable(db.dbTaskTable);
      return TaskData(
          dbTask.id,
          AccountData(dbAccount.id, dbAccount.name, dbAccount.purpose),
          dbTask.name,
          dbTask.description,
          null,
          dbTask.createdAt,
          dbTask.deadline,
          dbTask.completedAt);
    }).toList();
  }

  @override
  Future<TaskData> update(
      AppDatabase db, int id, DbTaskTableCompanion companion) async {
    await (db.update(db.dbTaskTable)..where((task) => task.id.equals(id)))
        .write(companion);
    return fetchItem(db, id);
  }
}
