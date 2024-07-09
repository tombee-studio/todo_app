import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/data/task_data.dart';

class TaskListAbstractItem extends StatelessWidget {
  final TaskData task;

  const TaskListAbstractItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final completedAt = task.completedAt;
    return ListTile(
        title: Text(task.name),
        subtitle:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(completedAt == null
              ? "作業中"
              : "完了日時：${DateFormat.yMMMMd().format(completedAt)} ${DateFormat.Hm().format(completedAt)}")
        ]));
  }

  IconData status(DateTime? completedAt) {
    if (completedAt == null) {
      return Icons.check_box_outline_blank;
    } else {
      return Icons.check_box;
    }
  }
}
