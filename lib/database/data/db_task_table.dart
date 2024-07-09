import 'package:drift/drift.dart';

class DbTaskTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get account => integer()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  IntColumn get parent => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get deadline => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
}
