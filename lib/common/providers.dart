import 'package:todo_app/bases/repository_provider.dart';
import 'package:todo_app/repository/account_screen_repository.dart';
import 'package:todo_app/repository/home_screen_repository.dart';
import 'package:todo_app/repository/task_screen_repository.dart';
import 'package:todo_app/ui/account/view_model/repository/account_screen_app_repository.dart';
import 'package:todo_app/ui/home/view_model/repository/home_screen_app_repository.dart';
import 'package:todo_app/ui/task/view_model/repository/task_screen_app_repository.dart';

final homeScreenRepositoryProvider =
    RepositoryProvider<HomeScreenRepository>(() => HomeScreenAppRepository());
final accountScreenRepositoryProvider =
    RepositoryProvider<AccountScreenRepository>(
        () => AccountScreenAppRepository());
final taskScreenRepositoryProvider =
    RepositoryProvider<TaskScreenRepository>(() => TaskScreenAppRepository());
