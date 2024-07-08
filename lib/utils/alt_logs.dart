import 'package:flutter/foundation.dart';

class LogUtils {
  static showLog(String tag, String sLog) {
    if (kDebugMode) {
      print('$tag - $sLog');
    }
  }
}
