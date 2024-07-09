import 'package:flutter/material.dart';
import 'package:todo_app/bases/view_model_state.dart';
import 'package:todo_app/ui/home/view_model/home_screen_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ViewModelState<HomeScreen, HomeScreenViewModel> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    viewModel.didChangeDependencies(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: viewModel.appBar(context),
      drawer: viewModel.drawer(context),
      body: viewModel.body(context),
      bottomNavigationBar: viewModel.bottomNavigationBar(context),
    );
  }

  @override
  createViewModel() => HomeScreenViewModel(this);
}
