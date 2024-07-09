import 'package:todo_app/data/account_data.dart';

class TaskData {
  final int id;
  final AccountData account;
  final String name;
  final String description;
  final TaskData? parent;
  final List<TaskData> children;
  final DateTime createdAt;
  final DateTime deadline;
  final DateTime? completedAt;

  TaskData(this.id, this.account, this.name, this.description, this.parent,
      this.children, this.createdAt, this.deadline, this.completedAt);

  bool get isCompleted => completedAt != null;
}
