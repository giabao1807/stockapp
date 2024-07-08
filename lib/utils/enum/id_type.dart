// ignore: camel_case_types
enum ID_TYPE { IDENTITY, PASSPORT }

extension IdTypeExt on ID_TYPE {
  static const types = {
    ID_TYPE.IDENTITY: 1,
    ID_TYPE.PASSPORT: 2,
  };

  static ID_TYPE getCustomerTypeFromString(String val) {
    switch (val) {
      case '1':
        return ID_TYPE.IDENTITY;
      case '2':
        return ID_TYPE.PASSPORT;
      default:
        return ID_TYPE.IDENTITY;
    }
  }

  int? get id => types[this];
}
