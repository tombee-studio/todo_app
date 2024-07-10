import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/data/project_data.dart';
import 'package:todo_app/database/app_database.dart';

abstract class ProjectCrudInterface {
  Future<List<ProjectData>> fetchList(AppDatabase db, AccountData account);
  Future<ProjectData> fetchItem(AppDatabase db, int id);
  Future<ProjectData> create(AppDatabase db, DbProjectTableCompanion companion);
  Future<ProjectData> update(
      AppDatabase db, int id, DbProjectTableCompanion companion);
  Future delete(AppDatabase db, int id);
}
