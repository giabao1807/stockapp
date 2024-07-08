import 'package:flutter_config/flutter_config.dart';
import 'package:mtsv4/global/global_sv.dart';
import 'package:mtsv4/styles/theme/default.theme.dart' as DEFAULT_COLOR;
import 'package:mtsv4/styles/theme/theme_888.theme.dart' as Theme_888;
import 'package:mtsv4/styles/theme/theme_004.theme.dart' as Theme_004;
import 'package:mtsv4/styles/theme/theme_020.theme.dart' as Theme_020;
import 'package:mtsv4/styles/theme/theme_023.theme.dart' as Theme_023;
import 'package:mtsv4/styles/theme/theme_028.theme.dart' as Theme_028;
import 'package:mtsv4/styles/theme/theme_036.theme.dart' as Theme_036;
import 'package:mtsv4/styles/theme/theme_061.theme.dart' as Theme_061;
import 'package:mtsv4/styles/theme/theme_075.theme.dart' as Theme_075;
import 'package:mtsv4/styles/theme/theme_081.theme.dart' as Theme_081;
import 'package:mtsv4/styles/theme/theme_082.theme.dart' as Theme_082;
import 'package:mtsv4/styles/theme/theme_099.theme.dart' as Theme_099;
import 'package:mtsv4/styles/theme/theme_102.theme.dart' as Theme_102;

Map<String, String> styles = DEFAULT_COLOR.LightColors;
Map<String, String> light = Map.from(DEFAULT_COLOR.LightColors);
Map<String, String> dark = Map.from(DEFAULT_COLOR.DarkColors);

void updateStyle() {
  if (glb_sv.theme == 'LIGHT') {
    styles = light;
  } else if (glb_sv.theme == 'DARK') {
    styles = dark;
  }
  print('finish load style');
}

void initStyle() {
  glb_sv.activeCode ??=
      FlutterConfig.get('SECCODE') ?? 'khong load duoc file env';
  switch (glb_sv.activeCode) {
    case '888':
      {
        light = Map.from(Theme_888.LIGHT);
        dark = Map.from(Theme_888.DARK);
        break;
      }
    case '004':
      {
        light = Map.from(Theme_004.LIGHT);
        dark = Map.from(Theme_004.DARK);
        break;
      }
    case '020':
      {
        light = Map.from(Theme_020.LIGHT);
        dark = Map.from(Theme_020.DARK);
        break;
      }
    case '023':
      {
        light = Map.from(Theme_023.LIGHT);
        dark = Map.from(Theme_023.DARK);
        break;
      }
    case '028':
      {
        light = Map.from(Theme_028.LIGHT);
        dark = Map.from(Theme_028.DARK);
        break;
      }
    case '036':
      {
        light = Map.from(Theme_036.LIGHT);
        dark = Map.from(Theme_036.DARK);
        break;
      }
    case '061':
      {
        light = Map.from(Theme_061.LIGHT);
        dark = Map.from(Theme_061.DARK);
        break;
      }
    case '075':
      {
        light = Map.from(Theme_075.LIGHT);
        dark = Map.from(Theme_075.DARK);
        break;
      }
    case '081':
      {
        light = Map.from(Theme_081.LIGHT);
        dark = Map.from(Theme_081.DARK);
        break;
      }
    case '082':
      {
        light = Map.from(Theme_082.LIGHT);
        dark = Map.from(Theme_082.DARK);
        break;
      }
    case '099':
      {
        light = Map.from(Theme_099.LIGHT);
        dark = Map.from(Theme_099.DARK);
        break;
      }
    case '102':
      {
        light = Map.from(Theme_102.LIGHT);
        dark = Map.from(Theme_102.DARK);
        break;
      }
  }
  updateStyle();
}
