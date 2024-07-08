library utils;

import 'dart:math';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimeUtils {
  static const _daysInMonthArray = [
    0,
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ];
  static final localDatePattern = DateFormat('dd-MM-yyyy');
  static DateTime? formatStringToDate(String? time, [String? format]) {
    final inputFormat = DateFormat(format ?? 'dd/MM/yyyy');
    if (time != null) {
      return inputFormat.parse(time);
    }
    return null;
  }

  static String formatDateToDisplay(DateTime? time, [String? outputFormat]) {
    if (time != null) {
      final output = DateFormat(outputFormat ?? 'dd/MM/yyyy');
      return output.format(time);
    } else {
      return '';
    }
  }

  static String addSplatDate(String strDate) {
    if (strDate.length == 8) {
      return '${strDate.substring(0, 2)}/${strDate.substring(2, 4)}/${strDate.substring(4, 8)}';
    }
    return '';
  }

  static DateTime covertDateTime(String? date) {
    final effectiveDate = date?.trim();

    if (effectiveDate != null && effectiveDate.isNotEmpty) {
      String dateWithT = effectiveDate.substring(0, 8) +
          'T' +
          (effectiveDate.length > 8 ? effectiveDate.substring(8) : '000000');
      DateTime dateTime = DateTime.parse(dateWithT);
      return dateTime;
    } else {
      return DateTime.now();
    }
  }

  static DateTime convertStringToTime(String? time) {
    final now = DateTime.now();
    if (time != null && time.length == 6) {
      return DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(time.substring(0, 2)),
        int.parse(time.substring(2, 4)),
        int.parse(time.substring(4, 6)),
      );
    } else {
      return now;
    }
  }

  static DateTime convertStringToDateTimeLenght6(String? time) {
    final now = DateTime.now();
    if (time != null && time.length == 6) {
      return DateTime(
        int.parse(time.substring(0, 4)),
        int.parse(time.substring(4, 6)),
      );
    } else {
      return now;
    }
  }

  static DateTime convertStringToDateTime(String? time) {
    final now = DateTime.now();
    if (time != null && time.length == 14) {
      return DateTime(
        int.parse(time.substring(4, 8)),
        int.parse(time.substring(2, 4)),
        int.parse(time.substring(0, 2)),
        int.parse(time.substring(8, 10)),
        int.parse(time.substring(10, 12)),
        int.parse(time.substring(12, 14)),
      );
    } else {
      return now;
    }
  }

  static DateTime ddMMyyyyToDate(String? time) {
    final now = DateTime.now();
    if (time != null && time.length == 8) {
      return DateTime(
        int.parse(time.substring(4, 8)),
        int.parse(time.substring(2, 4)),
        int.parse(time.substring(0, 2)),
      );
    } else {
      return now;
    }
  }

  static DateTime yyyyMMddHHmmssToDate(String? time) {
    final now = DateTime.now();
    if (time != null && time.length == 14) {
      return DateTime(
        int.parse(time.substring(0, 4)),
        int.parse(time.substring(4, 6)),
        int.parse(time.substring(6, 8)),
        int.parse(time.substring(8, 10)),
        int.parse(time.substring(10, 12)),
        int.parse(time.substring(12, 14)),
      );
    } else {
      return now;
    }
  }

  static DateTime yyyyMMddToDate(String? time) {
    final now = DateTime.now();
    if (time != null && time.length == 8) {
      return DateTime(
        int.parse(time.substring(0, 4)),
        int.parse(time.substring(4, 6)),
        int.parse(time.substring(6, 8)),
      );
    } else {
      return now;
    }
  }

  static DateTime subtract({
    DateTime? start,
    Duration duration = Duration.zero,
    int years = 0,
    int months = 0,
    int weeks = 0,
    int days = 0,
    int hours = 0,
    int minutes = 0,
    int seconds = 0,
    int milliseconds = 0,
    int microseconds = 0,
  }) {
    DateTime _dateTime = start ?? DateTime.now();
    _dateTime = _dateTime.subtract(duration);
    _dateTime = _dateTime.subtract(Duration(
      days: days + weeks * 7,
      hours: hours,
      minutes: minutes,
      seconds: seconds,
      milliseconds: milliseconds,
      microseconds: microseconds,
    ));
    _dateTime = _addMonths(_dateTime, -months);
    _dateTime = _addMonths(_dateTime, -years * 12);
    return _dateTime;
  }

  static List<DateTime> daysInMonth(DateTime month) {
    return daysInRange(firstDayOfMonth(month), lastDayOfMonth(month)).toList();
  }

  static DateTime firstDayOfMonth(DateTime month) {
    return DateTime(month.year, month.month);
  }

  static DateTime lastDayOfMonth(DateTime month) {
    var beginningNextMonth = (month.month < 12)
        ? DateTime(month.year, month.month + 1, 1)
        : DateTime(month.year + 1, 1, 1);
    return beginningNextMonth;
  }

  static Iterable<DateTime> daysInRange(DateTime start, DateTime end) sync* {
    var i = start;
    var offset = start.timeZoneOffset;
    while (i.isBefore(end)) {
      yield i;
      i = i.add(const Duration(days: 1));
      var timeZoneDiff = i.timeZoneOffset - offset;
      if (timeZoneDiff.inSeconds != 0) {
        offset = i.timeZoneOffset;
        i = i.subtract(Duration(seconds: timeZoneDiff.inSeconds));
      }
    }
  }

  static DateTime _addMonths(DateTime from, int months) {
    final r = months % 12;
    final q = (months - r) ~/ 12;
    var newYear = from.year + q;
    var newMonth = from.month + r;
    if (newMonth > 12) {
      newYear++;
      newMonth -= 12;
    }
    final newDay = min(from.day, _daysInMonth(newYear, newMonth));
    if (from.isUtc) {
      return DateTime.utc(newYear, newMonth, newDay, from.hour, from.minute,
          from.second, from.millisecond, from.microsecond);
    } else {
      return DateTime(newYear, newMonth, newDay, from.hour, from.minute,
          from.second, from.millisecond, from.microsecond);
    }
  }

  static int _daysInMonth(int year, int month) {
    var result = _daysInMonthArray[month];
    if (month == 2 && _isLeapYear(year)) result++;
    return result;
  }

  static bool _isLeapYear(int year) =>
      (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));

  static String getTimeDifferenceFromNow(DateTime date) {
    final date2 = DateTime.now();
    final difference = date2.difference(date);

    if (difference.inSeconds < 5) {
      return 'now'.tr;
    } else if (difference.inSeconds < 60) {
      return '${difference.inSeconds} ${'seconds'.tr} ${'ago'.tr}';
    } else if (difference.inMinutes <= 1) {
      return '1 ${'minute'.tr} ${'ago'.tr}';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} ${'minutes'.tr} ${'ago'.tr}';
    } else if (difference.inHours <= 1) {
      return '1 ${'hour'.tr} ${'ago'.tr}';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ${'hours'.tr} ${'ago'.tr}';
    } else if (difference.inDays <= 1) {
      return '1 ${'day'.tr} ${'ago'.tr}';
    } else if (difference.inDays < 6) {
      return '${difference.inDays} ${'days'.tr} ${'ago'.tr}';
    } else if ((difference.inDays / 7).ceil() <= 1) {
      return '1 ${'week'.tr} ${'ago'.tr}';
    } else if ((difference.inDays / 7).ceil() < 4) {
      return '${(difference.inDays / 7).ceil()} ${'weeks'.tr} ${'ago'.tr}';
    } else if ((difference.inDays / 30).ceil() <= 1) {
      return '1 ${'month'.tr} ${'ago'.tr}';
    } else if ((difference.inDays / 30).ceil() < 30) {
      return '${(difference.inDays / 30).ceil()} ${'months'.tr} ${'ago'.tr}';
    } else if ((difference.inDays / 365).ceil() <= 1) {
      return '1 ${'year'.tr} ${'ago'.tr}';
    }
    return '${(difference.inDays / 365).floor()} ${'years'.tr} ${'ago'.tr}';
  }

  static String display(DateTime value) {
    final now = DateTime.now();

    final difference = now.difference(value);
    if (difference.inHours <= now.hour) {
      return DateFormat('HH:mm').format(value);
    }
    return DateFormat('dd/MM/yyyy').format(value);
  }
}
