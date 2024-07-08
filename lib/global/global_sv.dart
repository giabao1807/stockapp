// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mtsv4/global/interface/i_service_info.dart';
import 'package:mtsv4/styles/theme/colors.dart';
import 'package:mtsv4/translate/laguage_contrain.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalApplication {
  Map<dynamic, dynamic> reqInfoMap = {};
// Subject<dynamic> eventMarket = Subject<dynamic>();
// Subject<dynamic> commonEvent = Subject<dynamic>();
// Subject<dynamic> eventConnect = Subject<dynamic>();
  bool authFlag = false;
  bool wait_reAuthFlag = false;
  bool permissNotify = false;
  bool publicFlag = false;
  dynamic activeCode;
  String activeAcnt = '';
  int expTimeout = 0;
  int discexpire = 0;
  int reqTimeout = 0;
  late ConfigInfo configInfo;
  bool refreshAccount = false;
  late ShareGlb objShareGlb;
  dynamic svTime;
  int gapSvTime = 0;
  List<dynamic> toastYN = [];
  List<String> otpCases = [];
  String timeServer = '';
  List<dynamic> mrk_stklist = [];
  String mrk_stklist_lang = '';
  String language = Platform.localeName.split('_')[0].toUpperCase().isNotEmpty
      ? Platform.localeName.split('_')[0].toLowerCase()
      : 'vi';
  String countryCode = window.locale.countryCode!.toUpperCase().isNotEmpty
      ? window.locale.countryCode!.toUpperCase()
      : 'VI';
  void changeLanguage(String lang, String countryCode) async {
    language = lang;
    this.countryCode = countryCode;
    Locale locale = Locale(lang);
    // LocalizationController().setLanguage(locale);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(LanguageConstant.COUNTRY_CODE, countryCode);
    sharedPreferences.setString(LanguageConstant.LANGUAGE_CODE, lang);
    Get.updateLocale(locale);
    print('change language 🐡🐡🐡 ============ $language');
  }

  String timeoutConnect = '';
  String imageAvatarUrl = '';
  List<dynamic> allListFav = [];
  Map<String, dynamic> activeList = {
    'ListStock': [],
    'isOddlot': false,
  };
  Map<String, dynamic> listStockOwn = {
    'ListStock': [],
  };
  Map<String, dynamic> industryTab = {
    'list': [],
    'activeCode': '',
    'activeList': [],
    'activeName': '',
  };
  String LastConnectStatus = '';
  String currentAppState = '';
  bool isInternetReachable = false;
  Map<dynamic, dynamic> networkState = {};
  bool waitingReconnectSocketFlag = false;
  bool waitingReLoginFlag = false;
  Map<dynamic, dynamic> mapDataEP = {};
  Map<dynamic, dynamic> mapSMLDataEP = {};
  Map<dynamic, dynamic> mapData5MEP = {};
  List<dynamic> subListCur = [];
  List<dynamic> subListCurStockScreener = [];
  bool focusPlaceOrder = false;
  bool focusAssetInfo = false;
  bool isConnectApp = false;
  List<dynamic> listIntradayTopMrk = [];
  List<Map<String, dynamic>> LIST_HEADER_PRICEBOARD = [
    {'name': '', 'type': '', 'isShow': false},
  ];
  List<Map<String, dynamic>> LIST_HEADER_PRICEBOARD_ODDLOT = [
    {'name': '', 'type': '', 'isShow': false},
  ];
  Map<dynamic, dynamic> IndexMarket = {};
  Map<dynamic, dynamic> StockMarket = {};
//   StatisticMarket: {
//       HSX: { key: string; STATIC: { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '1D': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '1W': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '1M': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '2M': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '3M': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '6M': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '1Y': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '3Y': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '5Y': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; };
//       HNX: { key: string; STATIC: { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '1D': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '1W': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '1M': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '2M': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '3M': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '6M': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '1Y': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '3Y': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '5Y': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; };
//       UPC: { key: string; STATIC: { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '1D': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '1W': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '1M': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '2M': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '3M': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '6M': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '1Y': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '3Y': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; '5Y': { TOP_VAL_UP: never[]; TOP_QTY_UP: never[]; FRG_VAL_UP: never[]; TOP_PRI_UP: never[]; TOP_PRI_DOWN: never[]; FRG_BUY_UP: never[]; FRG_SELL_UP: never[]; MARKET_CAP: never[]; }; }; getStatisticData: ({ key, time, topic }: { key: any; time: any; topic: any; }) => any; updateStatisticData: ({ key, time, topic, data }: { key: any; time: any; topic: any; data?: any[] | undefined; }) => any[] | undefined;
// };
  dynamic listIndex;
  dynamic listActiveIndex;
  List<dynamic> jsonIndexInfo = [];
  Map<String, dynamic> dataHisMrktop = {
    '1W': {},
    '1M': {},
    '3M': {},
    '6M': {},
    '1Y': {},
    '2Y': {},
    '3Y': {},
  };
  List<dynamic> LIST_GET_INDEX_MSG = [];
  Map<dynamic, dynamic> HISTORY_CHART = {};
  List<dynamic> STOCK_INFO_HSX = [];
  List<dynamic> STOCK_INFO_HNX = [];
  List<dynamic> STOCK_INFO_UPC = [];
  List<dynamic> warrant_list = [];
  List<dynamic> bonds_list = [];
  List<dynamic> etf_list = [];
  String TYPE_TOP_MARKET = '';
  Map<String, dynamic> lastDataMarketTop = {
    'TOP_VAL_UP': [],
    'TOP_QTY_UP': [],
    'FRG_VAL_UP': [],
    'TOP_PRI_UP': [],
    'TOP_PRI_DOWN': [],
  };
  String theme = 'LIGHT';
  void changeTheme(String theme) async {
    this.theme = theme.toUpperCase();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('app_theme', theme.toUpperCase());
    updateStyle();
    if (theme == 'DARK') {
      Get.changeThemeMode(ThemeMode.dark);
      Get.changeTheme(ThemeData.dark());
    } else {
      // Get.changeThemeMode(ThemeMode.light);
      Get.changeTheme(ThemeData.light());
    }

    Get.forceAppUpdate();
  }

  bool isVisibleMarket = false;
  Map<String, String> notifyOnesignal = {
    'userId': '',
    'pushToken': '',
  };
  Map<String, String> userInfo = {
    'actn_curr': '',
    'sub_curr': '',
  };
  Map<String, dynamic> userInfoAccount = {
    'actn_curr': '',
    'sub_curr': '',
    'actn_name': '',
    'sub_list': [],
    'actn_list': [],
  };
  List<dynamic> recentSearchAccount = [];
  Map<String, String> credentials = {
    'username': '',
    'password': '',
  };
  late IServiceResponeData dataEkycInfo;
  Map<dynamic, dynamic> timeAuthenOtp = {};
  Map<String, String> VERSION_STKLIST = {
    'HSX': '',
    'HNX': '',
    'UPC': '',
  };
  bool isAutoLogin = false;
  bool isWaitSendResultLogin = false;
  dynamic notifyOpened;
  List<dynamic> ListBankTrans = [];
  List<dynamic> ListBankReceive = [];
  List<dynamic> withdrawalBankList = [];
  List<dynamic> ListRightType = [];
  List<dynamic> ListRightTypeReceive = [];
  List<dynamic> brokerRemisierList = [];
  List<dynamic> bankLinkList = [];
  List<dynamic> bankLinkedWithShareCompany = [];
  String buildNumber = '';

  Map<String, String> objUserInfo = {
    'c33': '',
    'c32': '',
    'c35': '',
  };
  String deviceName = '';
  String deviceID = '';
  String deviceBuildNumber = '';
  String systemName = '';
  String systemVersion = '';
  String deviceVersion = '';
  String apiLevel = '';
  String readableVersion = '';
  String getDeviceInfos() {
    return '$deviceName;$deviceID;$deviceBuildNumber;$systemName;$systemVersion;$deviceVersion;$readableVersion;$apiLevel;';
  }

  bool checkLoadHistory = false;
  Map<dynamic, dynamic> controlTimeOutObj = {};
  clearTimeOutRequest(dynamic controlTimeOutKey) {}
  void clearReqInfoMapRequest(dynamic clientSeq) {}
  List<dynamic> notify = [];

  Map<String, String> lastAdvOrdInfo = {
    'acntNo': '',
    'sb_tp': '',
    'stkCode': '',
    'orderTp': '',
    'seasonTp': '',
    'price': '',
    'qty': '',
    'startDt': '',
    'endDt': '',
  };

  Map<String, String> lastOrdInfo = {
    'acntNo': '',
    'sb_tp': '',
    'stkCode': '',
    'orderTp': '',
    'price': '',
    'qty': '',
  };

  Map<String, dynamic> objLastOrder = {
    'stockCode': '',
    'price': 0,
    'qty': 0,
    'orderTp': '',
  };

  List<dynamic> ControlSubWatchlists = [];
  List<dynamic> ControlSubProfitLoss = [];
  void proc_ServerPushMRKRcv(dynamic message) {}
  void updI_MsgHistory(Map<dynamic, dynamic>? msgObj, dynamic isDone) {}
  dynamic timeoutINDEXMSG;
  void updAA_Msg2MrkInfoMap([Map<dynamic, dynamic>? msgObj]) {}
  void updTS_Msg2MrkInfoMap([Map<dynamic, dynamic>? msgObj]) {}
  dynamic getReqInfoMapValue(dynamic reqKey) {
    return reqInfoMap[reqKey as int];
  }

  String convUnixTime2StrDt(dynamic unixTm, dynamic DateTp) => '';
  int convStrDt2UnixTime(dynamic strTime) => 0;
  int convStrDtime2UnixTime(dynamic strTime) => 0;
  String convDate2StrDt(dynamic Datt) => '';
  String replaceStrToHTML(str, [bool isTransformBr = false]) => '';
  String filterStrBfParse(dynamic str) => '';
  void logMessage(dynamic message) {}
  num filterNumber(dynamic numberstr) => 0;
  void setItervClientTimeFunct() {}
  DateTime? orgTime;
  dynamic mrkInfo;
  String convDate2StrTime(dynamic) => '';
  Map<String, dynamic> convData2TradFormat(dynamic dataArrS) => {
        't': [],
        'o': [],
        'h': [],
        'l': [],
        'c': [],
        'v': [],
        's': '',
      };
  int dateToChartTimeMinute(dynamic date) => 0;
  DateTime convertUTCDateToLocalDate(dynamic date) => DateTime.now();
  int versionCompare(dynamic v1, dynamic v2, dynamic options) => 0;
  dynamic convertNameIndex(dynamic name) => null;
  List<dynamic> chartConvertIntraday(dynamic data) => [];
  List<dynamic> chartConvert15Second(dynamic data) => [];
  List<dynamic> chartConvert30Second(dynamic data) => [];
  List<dynamic> chartConvert2Minutes(dynamic data) => [];
  List<dynamic> chartConvert2Month(dynamic data) => [];
  List<dynamic> chartConvert2MonthServer(dynamic data) => [];
  List<dynamic> chartConvert2Year(dynamic data) => [];
  void convertDataChart5Days([List<dynamic>? data]) {}
  List<dynamic> chartConvertIndexWeek(dynamic data) => [];
  List<dynamic> chartConvertIndexMonth(dynamic data) => [];
  List<dynamic> chartConvertIndexYear(dynamic data) => [];
  dynamic createIndex(dynamic index) => null;
  dynamic getUnique(dynamic arr, dynamic comp) => null;
  List<dynamic> SMA(dynamic data, dynamic period) => [];
  List<dynamic> EMA(dynamic data, dynamic period, dynamic smoothing) => [];
  dynamic getColor(dynamic value, dynamic item, dynamic styles, dynamic key) =>
      null;
  List<dynamic> arr_diff(dynamic a1, dynamic a2) => [];
  List<dynamic> intersect(dynamic arr1, dynamic arr2) => [];
  bool checkOtp(dynamic navigation, dynamic functCallback) => false;
  bool isInvestorUser() => false;
  String cvStringToDate(dynamic time) => '';
  String convertTimeT52toDate(dynamic time) => '';
  dynamic convertTimeT52toTimetb(dynamic time) => null;
  void sendAuthReqSocketStream(
      {dynamic LoginID, dynamic MdmTp, dynamic Token}) {}
  Map<String, dynamic>? dataAuthStream;
  void logWebhook(dynamic type) {}
  void handleSubArrayNewList(dynamic newList, [Function()? subcribeTimeout]) {}
  void handleSubArrayNewListProfitLoss(dynamic newList,
      [Function()? subcribeTimeout]) {}
  void showModalOtp(
      dynamic message, dynamic functCallback, dynamic navigation) {}
  void sendDataStatictis() {}
  void sendEKYCLog(dynamic sEKYCLog, [String eKYCType = '']) {}
  void openEkyc(dynamic IOS, dynamic NativeModules, dynamic navigation,
      dynamic styles, dynamic isAuthen) {}
  dynamic getColorPriceboard(dynamic value, dynamic item, dynamic styles) =>
      null;
  void sprocess_ForOneMsg([dynamic msg]) {}
  // void setReqInfoMapValue();
  void process_MrkInfoMsgMuiltData([List<Never>? msgInfo]) {}

  setReqInfoMapValue(key, valObj) {
    reqInfoMap[key] = valObj;
  }

  dynamic updSI_Msg2MrkInfoMap;
  dynamic updTP_Msg2MrkInfoMap;
  dynamic updPO_Msg2MrkInfoMap;
  dynamic updEP_Msg2MrkInfoMap;
  dynamic updI_Msg2MrkInfoMap;
  dynamic updBI_Msg2MrkInfoMap;
  dynamic sendDataHandledStatictis;
  dynamic addZero;
  dynamic navigation;

  constructor() {}
}

class ConfigInfo {
  String subPathStream;
  String subPathTrading;
  String buildVersion;
  String fractionQty;
  String build_version;

  ConfigInfo({
    this.subPathStream = '',
    this.subPathTrading = '',
    this.buildVersion = '',
    this.fractionQty = '',
    this.build_version = '',
  });
}

class ShareGlb {
  SessionInfo? sessionInfo;
  UserInfo? userInfo;
  List<dynamic>? acntNoInfo;
  String? optType;

  ShareGlb({
    this.sessionInfo,
    this.userInfo,
    this.acntNoInfo,
    this.optType,
  });
}

class SessionInfo {
  String sessionId;
  String userID;
  bool remOrdPass;
  String orderPass;
  String Otp;
  String passID;

  SessionInfo({
    required this.sessionId,
    required this.userID,
    this.remOrdPass = false,
    this.orderPass = '',
    this.Otp = '',
    this.passID = '',
  });
}

class UserInfo {
  String c6;
  String c9;
  String c18;

  UserInfo({
    this.c6 = '',
    this.c9 = '',
    this.c18 = '',
  });
}

class DataHisMrktop {
  Map<String, dynamic> history;

  DataHisMrktop({
    required this.history,
  });
}

GlobalApplication glb_sv = GlobalApplication();

class DeviceInfo {
  String deviceName;
  String deviceId;
  String DeviceBuildNumber;
  String systemName;
  String systemVersion;
  String deviceVersion;
  String readableVersion;
  String apiLevel;
  DeviceInfo({
    required this.deviceName,
    required this.deviceId,
    required this.DeviceBuildNumber,
    required this.systemName,
    required this.systemVersion,
    required this.deviceVersion,
    required this.readableVersion,
    required this.apiLevel,
  });
}
