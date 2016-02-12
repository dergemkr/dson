import 'dart:convert';

import 'package:dson/dson.dart';
import 'package:test/test.dart';

import '../common/subtypes_common.dart';

main() {
  group('serialize subtypes >', () {
    test('subtype writes type key', () {
      var b = new Subtype(41);
      var map = JSON.decode(toJson(b));
      expect(map, equals({
        'type': 'sub',
        'onSub': 41,
        'onBase': 'set in constructor'
      }));
    });

    // TODO: Be more specific on exceptions
    test('serializing base is invalid', () {
      var base = new BaseType('test');
      expect(() => toJson(base), throws);
    });
  });
}
