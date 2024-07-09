import 'package:todo_app/bases/repository.dart';
import 'package:todo_app/data/account_data.dart';

abstract class AccountScreenRepository implements Repository {
  Future<AccountData> create(String name, String purpose);
}
