extension StringExt on String? {
  static String capitalizeFirstLetter(String value) {
    if (value == '') return value;
    return value[0].toUpperCase() + value.substring(1).toLowerCase();
  }

  bool get isNullOrEmpty => this == null || this?.isEmpty == true;

  /// Will return if the string is not null and not empty
  bool get isNotNullOrEmpty => !isNullOrEmpty;

  num get toNum => num.tryParse(this ?? '') ?? 0;

  bool isBlank(obj) {
    if (obj == null) {
      return true;
    } else if (obj.runtimeType == String && obj == '') {
      return true;
    }
    return false;
  }

  bool isNotBlank(obj) {
    return !isBlank(obj);
  }

  static String _addSplatDate(String strDate) {
    if (strDate.length == 8) {
      return '${strDate.substring(0, 2)}/${strDate.substring(2, 4)}/${strDate.substring(4, 8)}';
    }
    return '';
  }

  static String _unsigned(String? text) {
    const _vietnamese = 'aAeEoOuUiIdDyY';
    final _vietnameseRegex = <RegExp>[
      RegExp(r'à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ'),
      RegExp(r'À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ'),
      RegExp(r'è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ'),
      RegExp(r'È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ'),
      RegExp(r'ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ'),
      RegExp(r'Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ'),
      RegExp(r'ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ'),
      RegExp(r'Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ'),
      RegExp(r'ì|í|ị|ỉ|ĩ'),
      RegExp(r'Ì|Í|Ị|Ỉ|Ĩ'),
      RegExp(r'đ'),
      RegExp(r'Đ'),
      RegExp(r'ỳ|ý|ỵ|ỷ|ỹ'),
      RegExp(r'Ỳ|Ý|Ỵ|Ỷ|Ỹ')
    ];

    if (text != null) {
      String result = text;
      for (var i = 0; i < _vietnamese.length; ++i) {
        result = result.replaceAll(_vietnameseRegex[i], _vietnamese[i]);
      }
      return result;
    } else {
      return '';
    }
  }

  String get unsign => _unsigned(this);
  String get splatDate => _addSplatDate(this ?? '');
}
