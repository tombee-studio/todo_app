import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/bases/view_model_widget.dart';
import 'package:todo_app/data/project_data.dart';
import 'package:todo_app/ui/home/view_model/home_screen_view_model.dart';

class ProjectListItem extends ViewModelWidget<HomeScreenViewModel> {
  final ProjectData project;

  const ProjectListItem(
      {super.key, required super.parentViewModel, required this.project});

  @override
  Widget build(BuildContext context) {
    final completedAt = project.completedAt;
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
            title: Text(project.name),
            subtitle:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("完了予定日：${DateFormat.yMMMMd().format(project.deadline)}"),
              Text(completedAt == null
                  ? "作業中"
                  : "完了日時：${DateFormat.yMMMMd().format(completedAt)} ${DateFormat.Hm().format(completedAt)}")
            ]),
            leading: IconButton(
                onPressed: toggleStatus,
                icon: Icon(status(project.completedAt)))));
  }

  IconData status(DateTime? completedAt) {
    if (completedAt == null) {
      return Icons.check_box_outline_blank;
    } else {
      return Icons.check_box;
    }
  }

  void toggleStatus() {
    parentViewModel.toggleProjectStatus(project);
  }

  void edit(BuildContext context) {
    parentViewModel.openProjectScreen(context, project);
  }

  void delete(BuildContext context) {
    parentViewModel.deleteProject(project);
  }
}
