import 'package:todo_app/bases/value_object.dart';
import 'package:todo_app/data/account_data.dart';

class ProjectData extends ValueObject<ProjectData> {
  final int id;
  final AccountData account;
  final String name;
  final DateTime createdAt;
  final DateTime deadline;
  final DateTime? completedAt;

  ProjectData(this.id, this.account, this.name, this.createdAt, this.deadline,
      this.completedAt);

  @override
  int get identifier => id;
}
