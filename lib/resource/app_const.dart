import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppConst {
  static const int fetchCount = 20;

  static const int limitOfListDataLengthForEachRequest = 20;

  static const int inputDebounceTimeInMilliseconds = 440;

  static const int limitListIdsSendGetInfo = 10;

  static const int limitLengthPassword = 8;
  static const int maxLengthPassword = 20;
  //Cho mật khẩu cũ có 6 ký tự cho tài khoản cũ
  static const int limitLengthPasswordTemp = 6;

  static const int limitLengthTradingPassword = 4;
  static const int maxLengthTradingPassword = 6;
  static const int distanceBetweenQueryDateGetActionDate = 60;
  static const int limitLengthNameCom = 100;
  static final addressRegex = RegExp(
      r'^[a-z0-9A-ZàáãạảăắằẳẵặâấầẩẫậèéẹẻẽêềếểễệđìíĩỉịòóõọỏôốồổỗộơớờởỡợùúũụủưứừửữựỳỵỷỹýÀÁÃẠẢĂẮẰẲẴẶÂẤẦẨẪẬÈÉẸẺẼÊỀẾỂỄỆĐÌÍĨỈỊÒÓÕỌỎÔỐỒỔỖỘƠỚỜỞỠỢÙÚŨỤỦƯỨỪỬỮỰỲỴỶỸÝ.,-\/ ]*$');
  static final inputNameReg = RegExp(
      r'''[a-z0-9A-ZàáãạảăắằẳẵặâấầẩẫậèéẹẻẽêềếểễệđìíĩỉịòóõọỏôốồổỗộơớờởỡợùúũụủưứừửữựỳỵỷỹýÀÁÃẠẢĂẮẰẲẴẶÂẤẦẨẪẬÈÉẸẺẼÊỀẾỂỄỆĐÌÍĨỈỊÒÓÕỌỎÔỐỒỔỖỘƠỚỜỞỠỢÙÚŨỤỦƯỨỪỬỮỰỲỴỶỸÝ~`|.,•√π÷×¶∆£€$¢^°={}\\%©®™✓\[\]<>@#₫_&\-\+()\/*\':;!? "%]''');

  static final tagReg = RegExp(
      r'''\B@[a-z0-9A-ZàáãạảăắằẳẵặâấầẩẫậèéẹẻẽêềếểễệđìíĩỉịòóõọỏôốồổỗộơớờởỡợùúũụủưứừửữựỳỵỷỹýÀÁÃẠẢĂẮẰẲẴẶÂẤẦẨẪẬÈÉẸẺẼÊỀẾỂỄỆĐÌÍĨỈỊÒÓÕỌỎÔỐỒỔỖỘƠỚỜỞỠỢÙÚŨỤỦƯỨỪỬỮỰỲỴỶỸÝ~`|.,•√π÷×¶∆£€$¢^°={}\\%©®™✓\[\]<>@#₫_&\-\+()\/*\':;!?"%]+''');

  static final markTagReg = RegExp(
      r'''\B§[a-z0-9A-ZàáãạảăắằẳẵặâấầẩẫậèéẹẻẽêềếểễệđìíĩỉịòóõọỏôốồổỗộơớờởỡợùúũụủưứừửữựỳỵỷỹýÀÁÃẠẢĂẮẰẲẴẶÂẤẦẨẪẬÈÉẸẺẼÊỀẾỂỄỆĐÌÍĨỈỊÒÓÕỌỎÔỐỒỔỖỘƠỚỜỞỠỢÙÚŨỤỦƯỨỪỬỮỰỲỴỶỸÝ'~`|.,•√π÷×¶∆£€$¢^°={}\\%©®™✓\[\]<>@#₫_&\-\+()\/*\':;!?"%]+''');

  static final markTagRegRemove = RegExp(
      r'''([a-z0-9A-ZàáãạảăắằẳẵặâấầẩẫậèéẹẻẽêềếểễệđìíĩỉịòóõọỏôốồổỗộơớờởỡợùúũụủưứừửữựỳỵỷỹýÀÁÃẠẢĂẮẰẲẴẶÂẤẦẨẪẬÈÉẸẺẼÊỀẾỂỄỆĐÌÍĨỈỊÒÓÕỌỎÔỐỒỔỖỘƠỚỜỞỠỢÙÚŨỤỦƯỨỪỬỮỰỲỴỶỸÝ'~`|.,•√π÷×¶∆£€$¢^°={}\\%©®™✓\[\]<>@#₫_&\-\+()\/*\':;!?"]+\b(%{1,}))\b[a-z0-9A-ZàáãạảăắằẳẵặâấầẩẫậèéẹẻẽêềếểễệđìíĩỉịòóõọỏôốồổỗộơớờởỡợùúũụủưứừửữựỳỵỷỹýÀÁÃẠẢĂẮẰẲẴẶÂẤẦẨẪẬÈÉẸẺẼÊỀẾỂỄỆĐÌÍĨỈỊÒÓÕỌỎÔỐỒỔỖỘƠỚỜỞỠỢÙÚŨỤỦƯỨỪỬỮỰỲỴỶỸÝ'~`|.,•√π÷×¶∆£€$¢^°={}\\%©®™✓\[\]<>@#₫_&\-\+()\/*\':;!?"]+\b''');

  static final tagUserId = RegExp(r'\B§[0-9]+');

  static List<String> codeErrorReConfirmOtps = [
    '010034',
    '010035',
    '010037',
    '010038'
  ];

  static final tagsRegex = {
    markTagReg: TextStyle(
        color: AppColors.blue,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        backgroundColor: AppColors.blue.withOpacity(0.2)),
    tagReg: const TextStyle(),
    markTagRegRemove: const TextStyle(),
  };

  static final tagsRegexUserId = {
    tagUserId: TextStyle(
        color: AppColors.blue,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        backgroundColor: AppColors.blue.withOpacity(0.2)),
  };
}
