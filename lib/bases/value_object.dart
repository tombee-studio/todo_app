abstract class ValueObject<T> {
  int get valueId;

  @override
  bool operator ==(Object other) {
    final obj = other as T?;
    if (obj == null) {
      return false;
    }
    return hashCode == obj.hashCode;
  }

  @override
  int get hashCode => valueId;
}
