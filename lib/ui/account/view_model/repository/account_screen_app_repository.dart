import 'package:drift/drift.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/database/app_database.dart';
import 'package:todo_app/factory/account_factory.dart';
import 'package:todo_app/repository/account_screen_repository.dart';

class AccountScreenAppRepository extends AccountScreenRepository {
  @override
  Future<AccountData> create(String name, String purpose) async {
    final db = AppDatabase();
    return AccountFactory().create(db,
        DbAccountTableCompanion(name: Value(name), purpose: Value(purpose)));
  }
}
