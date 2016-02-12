part of dson;

class _MetadataExaminer<T> {
  const _MetadataExaminer();

  _MetadataExaminerOperations<T> type(TypeMirror mirror) =>
      new _MetadataExaminerOperations<T>(mirror.metadata);
  _MetadataExaminerOperations<T> method(MethodMirror mirror) =>
      new _MetadataExaminerOperations<T>(mirror.metadata);
  _MetadataExaminerOperations<T> declaration(DeclarationMirror mirror) =>
      new _MetadataExaminerOperations<T>(mirror.metadata);
}

class _MetadataExaminerOperations<T> {
  final List<Object> metadata;

  _MetadataExaminerOperations(this.metadata);

  bool get hasAnnotation => metadata.any(_isT);
  T get value => metadata.where(_isT).single;
  List<T> get values => metadata.where(_isT).toList();

  bool _isT(obj) => obj is T;
}
