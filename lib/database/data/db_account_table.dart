import 'package:drift/drift.dart';

class DbAccountTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get purpose => text()();
}
