import 'package:todo_app/bases/crud_factory.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/database/app_database.dart';
import 'package:todo_app/factory/interface/account_crud_interface.dart';

class AccountFactory extends CrudFactory<AccountData, DbAccountTableCompanion>
    implements AccountCrudInterface {
  static final AccountFactory _instance = AccountFactory._internal();
  factory AccountFactory() {
    return _instance;
  }
  AccountFactory._internal();

  @override
  Future<AccountData> create(
      AppDatabase db, DbAccountTableCompanion companion) async {
    final id = await db.into(db.dbAccountTable).insert(companion);
    return fetchItem(db, id);
  }

  @override
  Future delete(AppDatabase db, int id) async {
    await (db.delete(db.dbAccountTable)
          ..where((account) => account.id.equals(id)))
        .go();
  }

  @override
  Future<AccountData> fetchItem(AppDatabase db, int id) async {
    final item = await (db.select(db.dbAccountTable)
          ..where((account) => account.id.equals(id)))
        .getSingle();
    return AccountData(item.id, item.name, item.purpose);
  }

  @override
  Future<List<AccountData>> fetchList(AppDatabase db) async {
    final dbAccounts = await db.select(db.dbAccountTable).get();
    return dbAccounts
        .map((item) => AccountData(item.id, item.name, item.purpose))
        .toList();
  }

  @override
  Future<AccountData> update(
      AppDatabase db, int id, DbAccountTableCompanion companion) async {
    await (db.update(db.dbAccountTable)
          ..where((account) => account.id.equals(id)))
        .write(companion);
    return fetchItem(db, id);
  }
}
