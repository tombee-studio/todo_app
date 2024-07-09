import 'package:todo_app/bases/notifier.dart';
import 'package:todo_app/bases/view_model.dart';
import 'package:todo_app/common/providers.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/model/account/account_screen_model.dart';
import 'package:flutter/material.dart';

class AccountScreenViewModel extends ViewModel<AccountScreenModel> {
  final AccountData? initial;

  AccountScreenViewModel(super.notifier, this.initial);

  @override
  AccountScreenModel createModel(Notifier notifier) =>
      AccountScreenModel(initial, notifier, accountScreenRepositoryProvider);

  Widget content(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Icon(Icons.person),
          name(context),
          purpose(context)
        ]));
  }

  Widget name(BuildContext context) {
    return TextField(
        decoration: const InputDecoration(label: Text("アカウント名")),
        onChanged: (value) => model.name = value);
  }

  Widget purpose(BuildContext context) {
    return TextField(
        decoration: const InputDecoration(label: Text("目的・説明")),
        onChanged: (value) => model.purpose = value);
  }

  Widget body(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width >= 641) {
      return SizedBox(width: 640, child: content(context));
    } else {
      return content(context);
    }
  }

  Future<AccountData> addAccount() async {
    return await model.create();
  }
}
