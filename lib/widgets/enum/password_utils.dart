import 'dart:math';

import 'package:string_unescape/string_unescape.dart';

final _random = Random();

class PasswordUtils {
  static const int _maxSec = 20;
  static const int _maxItem = 20;
  static const int _basicNum = 40;
  static const List<List<int>> _secret = [
    [
      191,
      71,
      77,
      46,
      58,
      49,
      44,
      43,
      55,
      101,
      122,
      45,
      124,
      137,
      237,
      117,
      71,
      76,
      129,
      120
    ],
    [
      114,
      41,
      45,
      212,
      49,
      59,
      14,
      58,
      46,
      57,
      133,
      225,
      219,
      116,
      222,
      211,
      119,
      95,
      128,
      146
    ],
    [
      81,
      71,
      44,
      50,
      218,
      89,
      44,
      113,
      115,
      111,
      122,
      95,
      41,
      137,
      137,
      67,
      112,
      76,
      129,
      90
    ],
    [
      40,
      117,
      120,
      126,
      78,
      79,
      54,
      133,
      110,
      81,
      91,
      95,
      94,
      47,
      57,
      66,
      82,
      60,
      122,
      70
    ],
    [
      80,
      71,
      122,
      122,
      128,
      91,
      94,
      73,
      45,
      51,
      213,
      75,
      214,
      57,
      77,
      60,
      232,
      116,
      120,
      130
    ],
    [
      114,
      72,
      54,
      46,
      78,
      79,
      212,
      112,
      115,
      118,
      122,
      52,
      54,
      77,
      117,
      67,
      222,
      127,
      91,
      40
    ],
    [
      51,
      70,
      128,
      99,
      121,
      89,
      74,
      113,
      155,
      111,
      124,
      45,
      90,
      87,
      77,
      47,
      82,
      76,
      129,
      120
    ],
    [
      111,
      77,
      47,
      57,
      78,
      59,
      94,
      113,
      115,
      121,
      128,
      51,
      44,
      47,
      77,
      67,
      52,
      66,
      69,
      80
    ],
    [
      117,
      74,
      71,
      35,
      48,
      49,
      41,
      43,
      65,
      70,
      129,
      115,
      124,
      71,
      57,
      70,
      82,
      76,
      119,
      110
    ],
    [
      79,
      57,
      137,
      136,
      75,
      49,
      141,
      239,
      31,
      116,
      98,
      57,
      40,
      117,
      93,
      84,
      81,
      170,
      190,
      121
    ],
    [
      121,
      51,
      71,
      40,
      54,
      149,
      74,
      42,
      57,
      104,
      112,
      145,
      134,
      127,
      167,
      127,
      76,
      41,
      122,
      132
    ],
    [
      84,
      42,
      42,
      212,
      46,
      59,
      11,
      41,
      46,
      57,
      133,
      225,
      219,
      116,
      222,
      231,
      119,
      95,
      128,
      146
    ],
    [
      83,
      78,
      47,
      51,
      211,
      89,
      43,
      113,
      115,
      111,
      122,
      95,
      141,
      137,
      137,
      67,
      122,
      76,
      129,
      92
    ],
    [
      42,
      127,
      220,
      122,
      178,
      79,
      54,
      133,
      110,
      81,
      91,
      95,
      94,
      47,
      57,
      66,
      81,
      60,
      122,
      71
    ],
    [
      81,
      70,
      142,
      121,
      138,
      91,
      94,
      73,
      45,
      51,
      213,
      175,
      214,
      57,
      77,
      60,
      212,
      116,
      120,
      120
    ],
    [
      54,
      78,
      44,
      43,
      77,
      79,
      112,
      142,
      115,
      118,
      122,
      52,
      54,
      77,
      147,
      67,
      222,
      137,
      111,
      70
    ],
    [
      61,
      74,
      118,
      89,
      122,
      83,
      74,
      113,
      55,
      111,
      124,
      45,
      90,
      87,
      77,
      47,
      82,
      76,
      129,
      220
    ],
    [
      121,
      87,
      87,
      67,
      784,
      52,
      94,
      113,
      95,
      121,
      128,
      51,
      44,
      47,
      77,
      67,
      52,
      66,
      69,
      55
    ],
    [
      97,
      71,
      70,
      45,
      481,
      42,
      41,
      43,
      65,
      70,
      129,
      115,
      114,
      71,
      57,
      70,
      82,
      76,
      119,
      44
    ],
    [
      69,
      52,
      90,
      46,
      70,
      41,
      141,
      239,
      31,
      116,
      98,
      57,
      140,
      117,
      93,
      84,
      81,
      170,
      190,
      77
    ]
  ];
  static int getRandomIntInclusive(var min, var max) {
    min = min.ceil();
    max = max.floor();
    return min + _random.nextInt(max - min + 1);
  }

  static int getKeySecret() {
    var randomRange = _maxSec - 1;
    var randomNumber = getRandomIntInclusive(0, randomRange);
    return randomNumber;
  }

  static String encryptString(String originalData) {
    String utf8 = unescape(Uri.encodeFull(originalData));
    List<int> textToEncrypt = [];
    for (int i = 0; i < utf8.length; i++) {
      textToEncrypt.add(utf8.codeUnitAt(i));
    }
    List mNumberArray = encrypt(textToEncrypt);

    String str = "";
    for (int j = 0; j < mNumberArray.length; j++) {
      str += String.fromCharCode(mNumberArray[j]);
    }

    return str;
  }

  static String decryptString(String originalData) {
    String utf8 = originalData;
    List<int> textToEncrypt = [];
    for (int i = 0; i < utf8.length; i++) {
      textToEncrypt.add(utf8.codeUnitAt(i));
    }
    List mNumberArray = decrypt(textToEncrypt);

    String str = "";
    for (int j = 0; j < mNumberArray.length; j++) {
      str += String.fromCharCode(mNumberArray[j]);
    }

    return str;
  }

  static List encrypt(List<int> inStr) {
    List outEncryptStr = [];
    int strLen = inStr.length;
    int j = 0, key = 0, x = 0, num = 0;

    key = getKeySecret();
    outEncryptStr.add(key + _basicNum);

    for (int i = 0; i < strLen; i++) {
      x = inStr[i] + _secret[key][j];

      j += 1;
      if (j == _maxItem) j = 0;

      num = 0;
      if (x > _basicNum) {
        num = (x / _basicNum).floor();
        x = x % _basicNum + _basicNum;
      }
      outEncryptStr.add(num + _basicNum);
      outEncryptStr.add(x);
    }

    return outEncryptStr;
  }

  static List decrypt(List<int> inStr) {
    List outDecryptStr = [];
    int strLen = inStr.length;
    int j = 0, key = 0, x = 0, num = 0;

    if (strLen % 2 == 0) return List.empty();

    key = inStr[0] - _basicNum;

    for (int i = 1; i < strLen; i++) {
      if (i % 2 != 0) {
        num = inStr[i] - _basicNum;
        continue;
      }

      if (num > 0) {
        x = (num * _basicNum) + inStr[i] - _basicNum - _secret[key][j];
      } else {
        x = inStr[i] - _secret[key][j];
      }

      j += 1;
      if (j == _maxItem) j = 0;

      if (x <= 0) return List.empty();

      outDecryptStr.add(x);
    }

    return outDecryptStr;
  }
}
