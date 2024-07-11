import 'package:todo_app/bases/value_object.dart';

class AccountData extends ValueObject<AccountData> {
  final int id;
  final String name;
  final String purose;

  AccountData(this.id, this.name, this.purose);

  @override
  int get identifier => id;
}
