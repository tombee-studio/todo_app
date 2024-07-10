import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/bases/notifier.dart';
import 'package:todo_app/bases/view_model.dart';
import 'package:todo_app/common/providers.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/data/project_data.dart';
import 'package:todo_app/model/project_screen_model.dart';

class ProjectScreenViewModel extends ViewModel<ProjectScreenModel> {
  final AccountData account;
  final ProjectData? initial;
  ProjectScreenViewModel(super.notifier, this.account, {this.initial});

  Icon get buttonIcon {
    if (initial == null) {
      return const Icon(Icons.add);
    } else {
      return const Icon(Icons.mode_edit);
    }
  }

  @override
  ProjectScreenModel createModel(Notifier notifier) => ProjectScreenModel(
      initial, account, notifier, projectScreenRepositoryProvider);

  Widget content(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Icon(Icons.person),
          name(context),
          deadline(context),
          completedAt(context)
        ]));
  }

  Widget name(BuildContext context) {
    return TextFormField(
        decoration: const InputDecoration(label: Text("プロジェクト名")),
        initialValue: model.name,
        onChanged: (value) => model.name = value);
  }

  Widget deadline(BuildContext context) {
    return DateTimeFormField(
        mode: DateTimeFieldPickerMode.date,
        decoration: const InputDecoration(label: Text("完了予定日")),
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

  Widget body(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width >= 641) {
      return SizedBox(width: 640, child: content(context));
    } else {
      return content(context);
    }
  }

  Future<ProjectData> handleData() async {
    if (model.initial == null) {
      return await model.create();
    } else {
      return await model.update();
    }
  }
}
