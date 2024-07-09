import 'package:todo_app/bases/model.dart';
import 'package:todo_app/bases/property.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/repository/account_screen_repository.dart';

class AccountScreenModel extends Model<AccountScreenRepository> {
  final AccountData? initial;

  late Property<String> _name;
  late Property<String> _purpose;

  set name(String value) => _name.value = value;
  String get name => _name.value;

  set purpose(String value) => _purpose.value = value;
  String get purpose => _purpose.value;

  AccountScreenModel(this.initial, super.notifier, super.provider) {
    _name = propertyOf(initial?.name ?? "");
    _purpose = propertyOf(initial?.purose ?? "");
  }

  Future<AccountData> create() async {
    return await repository.create(_name.value, _purpose.value);
  }
}
