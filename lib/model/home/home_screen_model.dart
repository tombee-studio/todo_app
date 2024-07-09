import 'package:todo_app/bases/list_property.dart';
import 'package:todo_app/bases/model.dart';
import 'package:todo_app/bases/property.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/data/task_data.dart';
import 'package:todo_app/enum/home_screen_state.dart';
import 'package:todo_app/exception/not_created_account_error.dart';
import 'package:todo_app/repository/home_screen_repository.dart';

class HomeScreenModel extends Model<HomeScreenRepository> {
  late Property<bool> _isLoading;
  late Property<int> _currentAccountIndex;
  late Property<HomeScreenState> _currentState;
  late ListProperty<AccountData> _accounts;
  late ListProperty<TaskData> _tasks;

  bool get isLoading => _isLoading.value;
  List<AccountData> get accounts => _accounts.value;
  AccountData get currentAccount => accounts[currentAccountIndex];

  List<TaskData> get tasks => _tasks.value;

  int get currentAccountIndex => _currentAccountIndex.value;
  set currentAccountIndex(int value) {
    _currentAccountIndex.value = value;

    load();
  }

  HomeScreenState get pageState => _currentState.value;
  set pageState(HomeScreenState value) => _currentState.value = value;

  HomeScreenModel(super.notifier, super.provider) {
    _isLoading = propertyOf(true);
    _currentState = propertyOf(HomeScreenState.overview);
    _currentAccountIndex = propertyOf(0);
    _accounts = listPropertyOf(<AccountData>[]);
    _tasks = listPropertyOf(<TaskData>[]);
  }

  Future load() async {
    _isLoading.value = true;
    _accounts.value = await repository.fetchAccounts();
    if (accounts.isEmpty) {
      throw NotCreatedAccountError();
    }
    _tasks.value = await repository.fetchTasks(currentAccount);
    _isLoading.value = false;
  }

  Future toggleStatus(TaskData task, DateTime? completedAt) async {
    await repository.updateStatus(task, completedAt);
    await updateTasks();
  }

  Future updateTasks() async {
    _tasks.value = await repository.fetchTasks(currentAccount);
  }

  Future deleteTask(TaskData task) async {
    await repository.deleteTask(task);
  }
}
