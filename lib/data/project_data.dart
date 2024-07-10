import 'package:todo_app/data/account_data.dart';

class ProjectData {
  final int id;
  final AccountData account;
  final String name;
  final DateTime createdAt;
  final DateTime deadline;
  final DateTime? completedAt;

  ProjectData(this.id, this.account, this.name, this.createdAt, this.deadline,
      this.completedAt);
}
