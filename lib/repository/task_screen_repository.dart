import 'package:todo_app/bases/repository.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/data/project_data.dart';
import 'package:todo_app/data/task_data.dart';

abstract class TaskScreenRepository implements Repository {
  Future<TaskData> create(AccountData account, ProjectData project, String name,
      String description, TaskData? parent, DateTime deadline);

  Future<TaskData> update(
      TaskData task,
      AccountData account,
      ProjectData project,
      String name,
      String description,
      TaskData? parent,
      DateTime deadline);

  Future<List<ProjectData>> loadProjects(AccountData account);
}
