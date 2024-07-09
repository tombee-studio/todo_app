import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/database/app_database.dart';

abstract class AccountCrudInterface {
  Future<List<AccountData>> fetchList(AppDatabase db);
  Future<AccountData> fetchItem(AppDatabase db, int id);
  Future<AccountData> create(AppDatabase db, DbAccountTableCompanion companion);
  Future<AccountData> update(
      AppDatabase db, int id, DbAccountTableCompanion companion);
  Future delete(AppDatabase db, int id);
}
