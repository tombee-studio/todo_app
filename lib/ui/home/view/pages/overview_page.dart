import 'package:flutter/material.dart';
import 'package:todo_app/bases/view_model_widget.dart';
import 'package:todo_app/ui/home/view_model/home_screen_view_model.dart';

class OverviewPage extends ViewModelWidget<HomeScreenViewModel> {
  const OverviewPage({super.key, required super.parentViewModel});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Overview"));
  }
}
