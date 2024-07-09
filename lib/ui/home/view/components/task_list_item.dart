import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/bases/view_model_widget.dart';
import 'package:todo_app/data/task_data.dart';
import 'package:todo_app/ui/home/view_model/home_screen_view_model.dart';

class TaskListItem extends ViewModelWidget<HomeScreenViewModel> {
  final TaskData task;

  const TaskListItem(
      {super.key, required super.parentViewModel, required this.task});

  @override
  Widget build(BuildContext context) {
    final completedAt = task.completedAt;
    return Slidable(
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: edit,
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.mode_edit,
            label: '編集',
          ),
          SlidableAction(
            onPressed: delete,
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: '削除',
          )
        ]),
        child: ListTile(
            title: Text(task.name),
            subtitle:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(task.description),
              Text("完了予定日：${DateFormat.yMMMMd().format(task.deadline)}"),
              Text(completedAt == null
                  ? "作業中"
                  : "完了日時：${DateFormat.yMMMMd().format(completedAt)} ${DateFormat.Hm().format(completedAt)}")
            ]),
            leading: IconButton(
                onPressed: toggleStatus,
                icon: Icon(status(task.completedAt)))));
  }

  IconData status(DateTime? completedAt) {
    if (completedAt == null) {
      return Icons.check_box_outline_blank;
    } else {
      return Icons.check_box;
    }
  }

  void toggleStatus() {
    parentViewModel.toggleStatus(task);
  }

  void edit(BuildContext context) {
    parentViewModel.openTaskScreen(context, task);
  }

  void delete(BuildContext context) {
    parentViewModel.deleteTask(task);
  }
}
