import 'package:flutter/material.dart';
import 'package:todo_app/bases/view_model_widget.dart';
import 'package:todo_app/ui/home/view/components/task_list_item.dart';
import 'package:todo_app/ui/home/view_model/home_screen_view_model.dart';

class TaskListPage extends ViewModelWidget<HomeScreenViewModel> {
  const TaskListPage({super.key, required super.parentViewModel});

  @override
  Widget build(BuildContext context) {
    final tasks = parentViewModel.model.tasks;
    final inProgressTasks = tasks.where((task) => !task.isCompleted);
    final completedTasks = tasks.where((task) => task.isCompleted);
    return SingleChildScrollView(
        child: Column(children: [
      ExpansionTile(
          initiallyExpanded: true,
          title: Text("作業中のタスク(${inProgressTasks.length})"),
          children: inProgressTasks
              .map((task) =>
                  TaskListItem(parentViewModel: parentViewModel, task: task))
              .toList()),
      ExpansionTile(
          initiallyExpanded: true,
          title: Text("完了済み(${completedTasks.length})"),
          children: completedTasks
              .map((task) =>
                  TaskListItem(parentViewModel: parentViewModel, task: task))
              .toList())
    ]));
  }
}
