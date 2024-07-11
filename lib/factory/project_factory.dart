import 'package:drift/drift.dart';
import 'package:todo_app/bases/crud_factory.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/data/project_data.dart';
import 'package:todo_app/database/app_database.dart';
import 'package:todo_app/factory/interface/project_crud_interface.dart';

class ProjectFactory extends CrudFactory<ProjectData, DbProjectTableCompanion>
    implements ProjectCrudInterface {
  static final ProjectFactory _instance = ProjectFactory._internal();
  factory ProjectFactory() {
    return _instance;
  }
  ProjectFactory._internal();

  @override
  Future<ProjectData> create(
      AppDatabase db, DbProjectTableCompanion companion) async {
    final id = await db.into(db.dbProjectTable).insert(companion);
    return fetchItem(db, id);
  }

  @override
  Future delete(AppDatabase db, int id) async {
    await (db.delete(db.dbProjectTable)
          ..where((project) => project.id.equals(id)))
        .go();
    await (db.delete(db.dbTaskTable)..where((task) => task.project.equals(id)))
        .go();
  }

  @override
  Future<ProjectData> fetchItem(AppDatabase db, int id) async {
    final row = await (db.select(db.dbProjectTable)
          ..where((tbl) => tbl.id.equals(id)))
        .join([
      innerJoin(db.dbAccountTable,
          db.dbAccountTable.id.equalsExp(db.dbProjectTable.account))
    ]).getSingle();

    final dbAccount = row.readTable(db.dbAccountTable);
    final dbProject = row.readTable(db.dbProjectTable);
    return ProjectData(
        dbProject.id,
        AccountData(dbAccount.id, dbAccount.name, dbAccount.purpose),
        dbProject.name,
        dbProject.createdAt,
        dbProject.deadline,
        dbProject.completedAt);
  }

  @override
  Future<List<ProjectData>> fetchList(
      AppDatabase db, AccountData account) async {
    final rows = await (db.select(db.dbProjectTable)
          ..where((tbl) => tbl.account.equals(account.id)))
        .join([
      innerJoin(db.dbAccountTable,
          db.dbAccountTable.id.equalsExp(db.dbProjectTable.account))
    ]).get();

    return rows.map((row) {
      final dbAccount = row.readTable(db.dbAccountTable);
      final dbProject = row.readTable(db.dbProjectTable);
      return ProjectData(
          dbProject.id,
          AccountData(dbAccount.id, dbAccount.name, dbAccount.purpose),
          dbProject.name,
          dbProject.createdAt,
          dbProject.deadline,
          dbProject.completedAt);
    }).toList();
  }

  @override
  Future<ProjectData> update(
      AppDatabase db, int id, DbProjectTableCompanion companion) async {
    await (db.update(db.dbProjectTable)..where((task) => task.id.equals(id)))
        .write(companion);
    return fetchItem(db, id);
  }
}
