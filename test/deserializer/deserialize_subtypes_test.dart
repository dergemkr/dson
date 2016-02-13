import 'package:dson/dson.dart';
import 'package:test/test.dart';

import '../common/subtypes_common.dart';

main() {
  group('deserialize subtypes >', () {
    test('asdf', () {
      fromJson('{}', Subtype);
    });

    test('basic', () {
      var obj = fromJson('{"type":"sub","onSub":41}', BaseType);
      expect(obj, new isInstanceOf<Subtype>());
      expect(obj.onBase, equals('set in constructor'));
      expect(obj.onSub, equals(41));
    });

    // TODO: Be more specific on exceptions!
    test('missing subtype id', () {
      expect(() => fromJson('{}', BaseType), throws);
    });

    test('invalid subtype id', () {
      expect(() => fromJson('{"type":"c"}', BaseType), throws);
    });
  });
}
