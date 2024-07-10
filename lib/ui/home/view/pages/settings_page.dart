import 'package:flutter/material.dart';
import 'package:todo_app/bases/view_model_widget.dart';
import 'package:todo_app/ui/home/view/components/project_list_item.dart';
import 'package:todo_app/ui/home/view_model/home_screen_view_model.dart';

class SettingsPage extends ViewModelWidget<HomeScreenViewModel> {
  const SettingsPage({super.key, required super.parentViewModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            children: parentViewModel.model.projects
                .map((project) => ProjectListItem(
                    parentViewModel: parentViewModel, project: project))
                .toList()));
  }
}
