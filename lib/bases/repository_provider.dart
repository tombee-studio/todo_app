import 'package:todo_app/bases/provider.dart';
import 'package:todo_app/bases/repository.dart';

class RepositoryProvider<T extends Repository> extends Provider<T> {
  T get repository => instance;

  RepositoryProvider(T Function() generator) : super(generator);
}
