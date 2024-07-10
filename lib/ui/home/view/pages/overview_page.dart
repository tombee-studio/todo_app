import 'package:flutter/material.dart';
import 'package:todo_app/bases/view_model_widget.dart';
import 'package:todo_app/ui/home/view/components/task_list_abstract_item.dart';
import 'package:todo_app/ui/home/view_model/home_screen_view_model.dart';

class OverviewPage extends ViewModelWidget<HomeScreenViewModel> {
  const OverviewPage({super.key, required super.parentViewModel});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day + 1);
    final beforeDay = DateTime(now.year, now.month, now.day);
    final deadlineTask = parentViewModel.model.tasks
        .where((task) => task.deadline.isBefore(today));
    final uncompletedTasks = deadlineTask.where((task) => !task.isCompleted);
    final completedTasks = parentViewModel.model.tasks.where((task) {
      final completedAt = task.completedAt;
      if (completedAt == null) {
        return false;
      }
      return completedAt.isBefore(today) && completedAt.isAfter(beforeDay);
    });
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                      child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("概要",
                                    style: TextStyle(fontSize: 18.0)),
                                const Divider(),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      createRowItem(
                                          Icons.task,
                                          "全ての未完了のタスク",
                                          parentViewModel.model.tasks
                                              .where(
                                                  (task) => !task.isCompleted)
                                              .length)
                                    ]),
                              ]))),
                  Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ExpansionTile(
                                initiallyExpanded: true,
                                title: Text(
                                    "今日締め切りのタスク(${uncompletedTasks.length})"),
                                children: uncompletedTasks
                                    .map((task) =>
                                        TaskListAbstractItem(task: task))
                                    .toList()),
                            ExpansionTile(
                                initiallyExpanded: true,
                                title:
                                    Text("今日完了したタスク(${completedTasks.length})"),
                                children: completedTasks
                                    .map((task) =>
                                        TaskListAbstractItem(task: task))
                                    .toList())
                          ]))
                ])));
  }

  Widget createRowItem(IconData icon, String label, int value) {
    return Expanded(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Icon(icon),
      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Text("$value", textAlign: TextAlign.right),
        Text(label, textAlign: TextAlign.right)
      ])
    ]));
  }
}
