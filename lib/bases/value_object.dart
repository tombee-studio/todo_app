abstract class ValueObject<T> {
  int get identifier;

  @override
  bool operator ==(Object other) {
    final project = other as T?;
    if (project == null) {
      return false;
    }
    return hashCode == project.hashCode;
  }

  @override
  int get hashCode => identifier;
}
