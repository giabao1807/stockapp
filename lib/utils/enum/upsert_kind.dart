import 'package:get/get.dart';

enum UpsertKind { EDIT, ADD }

extension UpsertKindExt on UpsertKind {
  String get textButton {
    switch (this) {
      case UpsertKind.ADD:
        return 'add'.tr;
      case UpsertKind.EDIT:
        return 'save'.tr;
    }
  }
}
