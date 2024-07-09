import 'package:flutter/material.dart';
import 'package:todo_app/data/account_data.dart';

class AccountListDrawer extends StatelessWidget {
  final List<AccountData> accounts;
  final int currentAccountIndex;
  final void Function() addAccountCallback;
  final void Function(int) changeAccountCallback;

  const AccountListDrawer(
      {super.key,
      required this.accounts,
      required this.currentAccountIndex,
      required this.addAccountCallback,
      required this.changeAccountCallback});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      SizedBox(
          width: double.infinity,
          height: 84.0,
          child: DrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("アカウント"),
                    IconButton(
                        onPressed: addAccountCallback,
                        icon: const Icon(Icons.add))
                  ]))),
      Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                final account = accounts[index];
                return ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(account.name),
                    subtitle: Text(account.purose),
                    trailing: index == currentAccountIndex
                        ? const Icon(Icons.check)
                        : null,
                    onTap: () => changeAccountCallback(index));
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: accounts.length))
    ]));
  }
}
