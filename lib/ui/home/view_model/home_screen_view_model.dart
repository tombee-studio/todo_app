import 'package:flutter/material.dart';
import 'package:todo_app/bases/notifier.dart';
import 'package:todo_app/bases/view_model.dart';
import 'package:todo_app/common/providers.dart';
import 'package:todo_app/data/task_data.dart';
import 'package:todo_app/enum/home_screen_state.dart';
import 'package:todo_app/exception/not_created_account_error.dart';
import 'package:todo_app/model/home/home_screen_model.dart';
import 'package:todo_app/ui/account/view/component/account_list_drawer.dart';
import 'package:todo_app/ui/account/view/screen/account_screen.dart';
import 'package:todo_app/ui/home/view/pages/overview_page.dart';
import 'package:todo_app/ui/home/view/pages/settings_page.dart';
import 'package:todo_app/ui/home/view/pages/task_list_page.dart';
import 'package:todo_app/ui/task/view/screen/task_screen.dart';

class HomeScreenViewModel extends ViewModel<HomeScreenModel> {
  final String title = "Todo";
  HomeScreenViewModel(super.notifier);

  @override
  HomeScreenModel createModel(Notifier notifier) =>
      HomeScreenModel(notifier, homeScreenRepositoryProvider);

  AppBar appBar(BuildContext context) {
    switch (model.pageState) {
      case HomeScreenState.taskList:
        return AppBar(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            foregroundColor: Theme.of(context).colorScheme.primary,
            title: Text(title),
            actions: [
              IconButton(
                  onPressed: () async {
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            TaskScreen(account: model.currentAccount)));
                    await model.load();
                  },
                  icon: const Icon(Icons.add))
            ]);
      default:
        return AppBar(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            foregroundColor: Theme.of(context).colorScheme.primary,
            title: Text(title));
    }
  }

  Widget drawer(BuildContext context) {
    return AccountListDrawer(
        accounts: model.accounts,
        currentAccountIndex: model.currentAccountIndex,
        addAccountCallback: () async {
          Navigator.of(context).pop();
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const AccountScreen()));
          model.load().then(
              (_) => Navigator.of(context).popUntil((route) => route.isFirst));
        },
        changeAccountCallback: (index) {
          model.currentAccountIndex = index;
          Navigator.of(context).pop();
        });
  }

  Widget body(BuildContext context) {
    if (model.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    switch (model.pageState) {
      case HomeScreenState.overview:
        return OverviewPage(parentViewModel: this);
      case HomeScreenState.taskList:
        return TaskListPage(parentViewModel: this);
      case HomeScreenState.settings:
        return SettingsPage(parentViewModel: this);
    }
  }

  Widget bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: HomeScreenState.values.indexOf(model.pageState),
        onTap: onTap,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'タスク'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定')
        ]);
  }

  void onTap(int index) {
    model.pageState = HomeScreenState.values[index];
  }

  Future launch(BuildContext context) async {
    await model.load();
  }

  void didChangeDependencies(BuildContext context) {
    launch(context).catchError((ex) {
      if (ex is NotCreatedAccountError) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AccountScreen()));
      }
    });
  }

  void toggleStatus(TaskData task) {
    final completedAt = task.completedAt == null ? DateTime.now() : null;
    model.toggleStatus(task, completedAt);
  }

  void openTaskScreen(BuildContext context, TaskData task) async {
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            TaskScreen(account: model.currentAccount, initial: task)));
    await model.updateTasks();
  }

  void deleteTask(TaskData task) async {
    await model.deleteTask(task);
    await model.updateTasks();
  }
}
