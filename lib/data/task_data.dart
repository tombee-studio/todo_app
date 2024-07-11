import 'package:todo_app/bases/value_object.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/data/project_data.dart';

class TaskData extends ValueObject<TaskData> {
  final int id;
  final AccountData account;
  final String name;
  final String description;
  final ProjectData? project;
  final DateTime createdAt;
  final DateTime deadline;
  final DateTime? completedAt;

  TaskData(this.id, this.account, this.name, this.description, this.project,
      this.createdAt, this.deadline, this.completedAt);

  bool get isCompleted => completedAt != null;

  @override
  int get valueId => id;
}
