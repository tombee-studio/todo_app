import 'package:todo_app/bases/view_model_state.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/data/project_data.dart';
import 'package:todo_app/data/task_data.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/ui/task/view_model/task_screen_view_model.dart';

class TaskScreen extends StatefulWidget {
  final AccountData account;
  final List<ProjectData> projects;
  final TaskData? initial;

  const TaskScreen(
      {super.key, required this.account, required this.projects, this.initial});

  @override
  State<StatefulWidget> createState() => TaskScreenState();
}

class TaskScreenState extends ViewModelState<TaskScreen, TaskScreenViewModel> {
  @override
  TaskScreenViewModel createViewModel() =>
      TaskScreenViewModel(this, widget.account, widget.projects,
          initial: widget.initial);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("タスクを追加"),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          foregroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: viewModel.body(context),
        floatingActionButton: FloatingActionButton(
            onPressed: () =>
                viewModel.handleData().then((value) => Navigator.pop(context)),
            child: viewModel.buttonIcon));
  }
}
