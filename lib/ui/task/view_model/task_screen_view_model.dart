import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/bases/notifier.dart';
import 'package:todo_app/bases/view_model.dart';
import 'package:todo_app/common/providers.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/data/project_data.dart';
import 'package:todo_app/data/task_data.dart';
import 'package:todo_app/model/task_screen_model.dart';

class TaskScreenViewModel extends ViewModel<TaskScreenModel> {
  final List<ProjectData> projects;
  final AccountData account;
  final TaskData? initial;
  TaskScreenViewModel(super.notifier, this.account, this.projects,
      {this.initial});

  Icon get buttonIcon {
    if (initial == null) {
      return const Icon(Icons.add);
    } else {
      return const Icon(Icons.mode_edit);
    }
  }

  @override
  TaskScreenModel createModel(Notifier notifier) =>
      TaskScreenModel(notifier, taskScreenRepositoryProvider, account,
          initial: initial);

  Widget content(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Icon(Icons.person),
          name(context),
          purpose(context),
          deadline(context),
          completedAt(context),
          project(context)
        ]));
  }

  Widget name(BuildContext context) {
    return TextFormField(
        decoration: const InputDecoration(label: Text("タスク名")),
        initialValue: model.name,
        onChanged: (value) => model.name = value);
  }

  Widget purpose(BuildContext context) {
    return TextFormField(
        decoration: const InputDecoration(label: Text("説明")),
        initialValue: model.description,
        onChanged: (value) => model.description = value);
  }

  Widget deadline(BuildContext context) {
    return DateTimeFormField(
        mode: DateTimeFieldPickerMode.date,
        decoration: const InputDecoration(label: Text("締め切り日時")),
        initialValue: model.deadline,
        onChanged: (value) {
          if (value != null) {
            model.deadline = value;
          }
        });
  }

  Widget completedAt(BuildContext context) {
    return DateTimeFormField(
        mode: DateTimeFieldPickerMode.dateAndTime,
        decoration: const InputDecoration(label: Text("完了日時")),
        initialValue: model.completedAt,
        onChanged: (value) {
          if (value != null) {
            model.completedAt = value;
          }
        });
  }

  Widget project(BuildContext context) {
    return DropdownButtonFormField<ProjectData>(
        value: model.project,
        items: projects
            .map((item) => DropdownMenuItem<ProjectData>(
                value: item, child: Text(item.name)))
            .toList(),
        decoration: const InputDecoration(label: Text("プロジェクト")),
        onChanged: (value) {
          if (value != null) {
            model.project = value;
          }
        });
  }

  Widget body(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width >= 641) {
      return SizedBox(width: 640, child: content(context));
    } else {
      return content(context);
    }
  }

  Future<TaskData> handleData() async {
    if (model.initial == null) {
      return await model.create();
    } else {
      return await model.update();
    }
  }
}
