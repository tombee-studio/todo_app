import 'package:todo_app/bases/view_model_state.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/ui/account/view_model/account_screen_view_model.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  final AccountData? initial;

  const AccountScreen({super.key, this.initial});

  @override
  State<StatefulWidget> createState() => AccountScreenState();
}

class AccountScreenState
    extends ViewModelState<AccountScreen, AccountScreenViewModel> {
  @override
  AccountScreenViewModel createViewModel() =>
      AccountScreenViewModel(this, widget.initial);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("アカウントを追加"),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          foregroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: viewModel.body(context),
        floatingActionButton: FloatingActionButton(
            onPressed: () =>
                viewModel.addAccount().then((value) => Navigator.pop(context)),
            child: const Icon(Icons.add)));
  }
}
