import 'package:todo_app/bases/model.dart';
import 'package:todo_app/bases/notifier.dart';

abstract class ViewModel<T extends Model> {
  final Notifier _notifier;

  late T _model;
  T get model => _model;

  ViewModel(this._notifier) {
    _model = createModel(_notifier);
  }

  T createModel(Notifier notifier);

  void deactivate() {}
}
