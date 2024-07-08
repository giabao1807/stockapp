import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';
import 'package:mtsv4/extentions.dart';
import 'package:mtsv4/features/asset/s2023_asset_screen.dart';
import 'package:mtsv4/features/market_tab/market_tab.dart';
import 'package:mtsv4/presentation/auth_controller.dart';
import 'package:mtsv4/presentation/global_controller.dart';
import 'package:mtsv4/translate/Language_modal.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:mtsv4/application_config.dart';
import 'package:mtsv4/features/services/services_page.dart';
import 'package:mtsv4/features/splash_screen/splash_screen_page.dart';
import 'package:mtsv4/global/global_app_config.dart';
import 'package:mtsv4/global/global_sv.dart';
import 'package:mtsv4/global/socket_sv.dart';
import 'package:mtsv4/screens/main_bottom_navigation.dart';
import 'package:mtsv4/styles/helper/dimentions.dart';
import 'package:mtsv4/styles/helper/font_size.dart';
import 'package:mtsv4/styles/helper/font_weight.dart';
import 'package:mtsv4/styles/theme/colors.dart';
import 'package:mtsv4/styles/theme_data.dart';
import 'package:mtsv4/translate/language_config_modal.dart';
import 'package:mtsv4/translate/language_controller.dart' as LANGUAGECONFIG;
import 'package:mtsv4/utils/common.dart';

const String TAG = 'MAIN';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await loadInFirstRun();
  Map<String, Map<String, String>> languages = await LANGUAGECONFIG.init();
  Get.put(GlobalService(), permanent: true);
  Get.put(AuthService(), permanent: true);
  runApp(MyApp(languages: languages));
}

loadInFirstRun() async {
  String activeCode =
      FlutterConfig.get('SECCODE') ?? 'khong load duoc file env';
  GlobalAppConfig? applicationConfig = await loadData(activeCode);
  appConfig = applicationConfig; // save config to application config
  if (applicationConfig != null) {
    // if (socket_sv.serverNodeIndex.isNaN) {
    //   setConfigNodeServer();
    // }
    setConfigNodeServer();
    // thực hiện thiết lập kết nối socket
    handleAppStateChange('active', '');
  }
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  glb_sv.theme = sharedPreferences.getString('app_theme') ?? 'LIGHT';
  initStyle(); // call update theme value
  // glb_sv.deviceBuildNumber =
}

setConfigNodeServer() {
  String activeCd = glb_sv.activeCode.toString();
  // const node_server = SyncStorage.get(STORE_KEY.SERVER) || 0;
  const nodeServer = 1 | 0;
  // socket_sv.serverNodeArr = appConfig!.server_node_list;
  // socket_sv.serverNodeIndex = nodeServer;
  // socket_sv.marketUrlArr =
  //     appConfig!.server_node_list[nodeServer].stream_server.ip_address;
  // socket_sv.serviceUrlArr =
  //     appConfig!.server_node_list[nodeServer].trading_server.ip_address;
}

handleAppStateChange(String nextAppState, String? socketNm) {
  // socket_sv.createSocketConnection(); //todo: kết nối socket tại đây, lưu ý sửa
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.languages});
  final Map<String, Map<String, String>> languages;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData themeData;
    if (glb_sv.theme == 'LIGHT') {
      themeData = lightThemeData;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: styles['PRIMARY__BG__COLOR']!.toColor(),
        statusBarBrightness: Brightness.light,
      ));
    } else {
      themeData = darkThemeData;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: styles['PRIMARY__BG__COLOR']!.toColor(),
        statusBarBrightness: Brightness.dark,
      ));
    }
    return GetBuilder<LocalizationController>(
        builder: (localizationController) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: localizationController.locale,
        translations: LanguagesModal(languages: languages),
        fallbackLocale: Locale(glb_sv.language, glb_sv.countryCode),
        theme: themeData,
        home: const SplashWidget(),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void navigateToMain(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MainBottomNavigation(),
      ),
    );
  }

  int _selectedIndex = 0;

  static TextStyle optionStyle =
      TextStyle(fontSize: fontSizes.normal, fontWeight: fontWeights.thin);

  static final List<Widget> _widgetOptions = <Widget>[
    const SafeArea(child: MarketTab()),
    const SafeArea(child: AssetScreen()),
    // Text(
    //   'order_tab'.tr,
    //   style: optionStyle,
    // ),
    // Text(
    //   'notify_news_tab'.tr,
    //   style: optionStyle,
    // ),
    const ServicePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          CustomBottomNavigationBarItem(
                  assetName: 'assets/images/ic3_market.png',
                  label: 'market_info_tab')
              .build(),
          CustomBottomNavigationBarItem(
                  assetName: 'assets/images/ic3_portfolio.png',
                  label: 'title_assets_tab')
              .build(),
          // CustomBottomNavigationBarItem(
          //         assetName: 'assets/images/ic3_order.png', label: 'order_tab')
          //     .build(),
          // CustomBottomNavigationBarItem(
          //         assetName: 'assets/images/ic3_news.png',
          //         label: 'notify_news_tab')
          //     .build(),
          CustomBottomNavigationBarItem(
                  assetName: 'assets/images/ic3_service.png',
                  label: 'service_tab')
              .build(),
        ],
        // unselectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 11),
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: styles['TABBAR__INACTIVE__COLOR']!.toColor(),
        selectedItemColor: styles['TABBAR__ACTIVE__COLOR']!.toColor(),
        unselectedLabelStyle:
            TextStyle(color: styles['TABBAR__INACTIVE__COLOR']!.toColor()),
        selectedLabelStyle:
            TextStyle(color: styles['TABBAR__ACTIVE__COLOR']!.toColor()),
        showUnselectedLabels: true,
        selectedFontSize: fontSizes.smallest,
        unselectedFontSize: fontSizes.smallest,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CustomBottomNavigationBarItem {
  final String assetName;
  final String label;
  CustomBottomNavigationBarItem({required this.assetName, required this.label});

  BottomNavigationBarItem build() {
    return BottomNavigationBarItem(
        icon: Image(
          image: AssetImage(assetName),
          height: moderate(24),
          width: moderate(24),
          color: styles['TABBAR__INACTIVE__COLOR']!.toColor(),
        ),
        activeIcon: Image(
          image: AssetImage(
            assetName,
          ),
          height: moderate(24),
          width: moderate(24),
          color: styles['TABBAR__ACTIVE__COLOR']!.toColor(),
        ),
        label: label.tr);
  }
}
