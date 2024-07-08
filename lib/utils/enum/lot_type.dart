import 'package:get/get.dart';

enum LOT_TYPE { EVEN, ODD }

extension LotTypeExt on LOT_TYPE {
  static const names = {
    LOT_TYPE.EVEN: 'even_lot',
    LOT_TYPE.ODD: 'odd_lot',
  };

  String get display => names[this]?.tr ?? '';
}
