import 'package:todo_app/bases/model.dart';
import 'package:todo_app/bases/property.dart';
import 'package:todo_app/data/account_data.dart';
import 'package:todo_app/data/task_data.dart';
import 'package:todo_app/repository/task_screen_repository.dart';

class TaskScreenModel extends Model<TaskScreenRepository> {
  final AccountData account;
  final TaskData? initial;

  late Property<String> _name;
  late Property<String> _description;
  // late Property<TaskData> _parent;
  // late ListProperty<TaskData> _children;
  late Property<DateTime> _deadline;
  late Property<DateTime?> _completedAt;

  set name(String value) => _name.value = value;
  String get name => _name.value;

  set description(String value) => _description.value = value;
  String get description => _description.value;

  // set parent(TaskData value) => _parent.value = value;
  // TaskData get parent => _parent.value;

  // TaskData get parent => _children.value;

  set deadline(DateTime value) => _deadline.value = value;
  DateTime get deadline => _deadline.value;

  set completedAt(DateTime? value) => _completedAt.value = value;
  DateTime? get completedAt => _completedAt.value;

  TaskScreenModel(super.notifier, super.provider, this.account,
      {this.initial}) {
    _name = propertyOf(initial?.name ?? "");
    _description = propertyOf(initial?.description ?? "");
    _deadline = propertyOf(initial?.deadline ?? DateTime.now());
    _completedAt = propertyOf(initial?.completedAt);
  }

  Future<TaskData> create() =>
      repository.create(account, name, description, null, deadline);

  Future<TaskData> update() {
    final initialValue = initial;
    if (initialValue != null) {
      return repository.update(
          initialValue, account, name, description, null, deadline);
    }
    throw UnsupportedError("初期値が与えられていません");
  }
}
