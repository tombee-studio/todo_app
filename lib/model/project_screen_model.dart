import 'package:todo_app/bases/model.dart';
import 'package:todo_app/bases/property.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/data/project_data.dart';
import 'package:todo_app/repository/project_screen_repository.dart';

class ProjectScreenModel extends Model<ProjectScreenRepository> {
  final AccountData account;
  final ProjectData? initial;

  late Property<String> _name;
  late Property<DateTime> _createdAt;
  late Property<DateTime> _deadline;
  late Property<DateTime?> _completedAt;

  set name(String value) => _name.value = value;
  String get name => _name.value;

  set createdAt(DateTime value) => _createdAt.value = value;
  DateTime get createdAt => _createdAt.value;

  set deadline(DateTime value) => _deadline.value = value;
  DateTime get deadline => _deadline.value;

  set completedAt(DateTime? value) => _completedAt.value = value;
  DateTime? get completedAt => _completedAt.value;

  ProjectScreenModel(
      this.initial, this.account, super.notifier, super.provider) {
    _name = propertyOf(initial?.name ?? "");
    _createdAt = propertyOf(initial?.createdAt ?? DateTime.now());
    _deadline = propertyOf(initial?.deadline ?? DateTime.now());
    _completedAt = propertyOf(initial?.completedAt);
  }

  Future<ProjectData> create() async {
    return await repository.create(
        account, name, createdAt, deadline, completedAt);
  }

  Future<ProjectData> update() {
    final initialValue = initial;
    if (initialValue != null) {
      return repository.update(
          initialValue, account, name, createdAt, deadline, completedAt);
    }
    throw UnsupportedError("初期値が与えられていません");
  }
}
