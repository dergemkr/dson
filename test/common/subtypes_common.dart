import 'package:dson/dson.dart';

@serializable
@HasSubtypes('type', const [Subtype])
class BaseType {
  final String onBase;

  BaseType(this.onBase);
}

@serializable
@IsSubtype('sub', BaseType)
class Subtype extends BaseType {
  final int onSub;

  Subtype(this.onSub) : super('set in constructor');
}
