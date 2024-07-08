import 'package:get/get.dart';

// ignore: camel_case_types
enum TYPE_OF_DATE { QUARTERLY, ANNUAL }

extension TypeOfDateExt on TYPE_OF_DATE {
  static const _name = {
    TYPE_OF_DATE.QUARTERLY: 'quarterly',
    TYPE_OF_DATE.ANNUAL: 'annual',
  };
  static const _types = {
    TYPE_OF_DATE.QUARTERLY: 'Q',
    TYPE_OF_DATE.ANNUAL: 'Y',
  };

  String get name => _name[this]?.tr ?? '';
  String get type => _types[this]?.tr ?? '';
}
