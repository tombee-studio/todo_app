import 'package:todo_app/bases/repository.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/data/project_data.dart';
import 'package:todo_app/data/task_data.dart';

abstract class HomeScreenRepository extends Repository {
  Future<List<AccountData>> fetchAccounts();
  Future<List<TaskData>> fetchTasks(AccountData account);
  Future<List<ProjectData>> fetchProjects(AccountData account);

  Future updateProjectStatus(ProjectData project, DateTime? completedAt);
  Future<TaskData> updateStatus(TaskData task, DateTime? completedAt);

  Future deleteProject(ProjectData project);
  Future deleteTask(TaskData task);
}
