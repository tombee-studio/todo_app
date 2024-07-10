import 'package:todo_app/bases/view_model_state.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/data/project_data.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/ui/project/view_model/project_screen_view_model.dart';

class ProjectScreen extends StatefulWidget {
  final AccountData account;
  final ProjectData? initial;

  const ProjectScreen({super.key, required this.account, this.initial});

  @override
  State<StatefulWidget> createState() => TaskScreenState();
}

class TaskScreenState
    extends ViewModelState<ProjectScreen, ProjectScreenViewModel> {
  @override
  ProjectScreenViewModel createViewModel() =>
      ProjectScreenViewModel(this, widget.account, initial: widget.initial);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("プロジェクトを追加"),
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
