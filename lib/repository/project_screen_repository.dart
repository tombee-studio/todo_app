import 'package:todo_app/bases/repository.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/data/project_data.dart';

abstract class ProjectScreenRepository implements Repository {
  Future<ProjectData> create(AccountData account, String name,
      DateTime createdAt, DateTime deadline, DateTime? completedAt);

  Future<ProjectData> update(
      ProjectData project,
      AccountData account,
      String name,
      DateTime createdAt,
      DateTime deadline,
      DateTime? completedAt);
}
