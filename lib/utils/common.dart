import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:mtsv4/global/global_app_config.dart';
import 'dart:convert';
import 'package:collection/collection.dart';

import 'package:flutter/services.dart';
import 'package:mtsv4/global/global_sv.dart';

List<ServerNode> serverNodeListFromJson(List<dynamic> jsonList) {
  return List<ServerNode>.generate(
    jsonList.length,
    (index) => ServerNode.fromJson(jsonList[index]),
  );
}

Future<GlobalAppConfig?> loadData(activeCode) async {
  final jsonString =
      await rootBundle.loadString('assets/configs/config_test.json');
  GlobalAppConfig? applicationConfig;
  Map<String, dynamic> jsonArray = json.decode(jsonString);

  jsonArray.forEach((key, value) {
    if (key.contains(activeCode)) {
      GlobalAppConfig? config =
          GlobalAppConfig.fromJson(value as Map<String, dynamic>);
      applicationConfig = config;
    }
  });
  print(applicationConfig?.shortName.toString());
  DeviceInfoPlugin deviceInfo =
      DeviceInfoPlugin(); // todo: add application version in here
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo;
    androidInfo = await deviceInfo.androidInfo;
    glb_sv.deviceName = androidInfo.model;
    glb_sv.deviceID = androidInfo.device;
    glb_sv.deviceBuildNumber = '1';
    glb_sv.systemName = 'Android';
    glb_sv.systemVersion = androidInfo.version.release;
    glb_sv.deviceVersion = '';
    glb_sv.readableVersion = '5.0.0';
    glb_sv.apiLevel = androidInfo.version.sdkInt.toString();
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo;
    iosInfo = await deviceInfo.iosInfo;
    glb_sv.deviceName = iosInfo.name;
    glb_sv.deviceID = iosInfo.identifierForVendor;
    glb_sv.deviceBuildNumber = '1';
    glb_sv.systemName = 'IOS';
    glb_sv.systemVersion = iosInfo.systemVersion;
    glb_sv.deviceVersion = '';
    glb_sv.readableVersion = '5.0.0';
    glb_sv.apiLevel = iosInfo.systemVersion;
  }
  return applicationConfig;
}

bool baseIsEqual(dynamic value, dynamic other) {
  if (value == other) {
    return true;
  }

  if (value is List || value is Set || value is Map) {
    return const DeepCollectionEquality().equals(value, other);
  }

  return false;
}
