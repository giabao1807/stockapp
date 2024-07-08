import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtsv4/application_config.dart';

import 'package:mtsv4/common/input_widget.dart';
import 'package:mtsv4/common/show_alert.dart';
import 'package:mtsv4/common/text_icon_button.dart';
import 'package:mtsv4/extentions.dart';
import 'package:mtsv4/features/login/Presenter/login_presenter.dart';
import 'package:mtsv4/features/login/views/login_view.dart';
import 'package:mtsv4/features/services/services_page.dart';
import 'package:mtsv4/global/global_sv.dart';
import 'package:mtsv4/main.dart';
import 'package:mtsv4/utils/constants/common_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginView {
  late LoginPresenter presenter;
  final userNameCtrl = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    presenter = LoginPresenter(this);
  }

  @override
  void toast(String message, BuildContext context) =>
      showAlert(context, message);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_left,
                size: 35,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ServicePage()),
                );
              },
            ),
            bottomOpacity: 0.0,
            elevation: 0.0,
            actions: [
              Row(
                children: [
                  DropdownButton(
                    iconEnabledColor: Colors.white,
                      value: glb_sv.language,
                      underline: const SizedBox(),
                      items: appConfig!.language_list
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value.toUpperCase(),
                           
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        presenter.changeLanguage(value);
                      })
                ],
              )
            ],
          ),
          body: Center(
            child: SingleChildScrollView(
              // controller: controller,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/alt_login_logo.jpg'),
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                    Text(
                        glb_sv.language == 'vi'
                            ? appConfig!.comp_full.toString() 
                            : appConfig!.comp_full_e,
                        style: TextStyle(
                          color: '#ffffff'.toColor(),
                          fontSize: 17,
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: 360,
                      child: TextField(
                        controller: userNameCtrl,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'username'.tr,
                          labelStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 360,
                      child: TextField(
                        controller: passwordController,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "password".tr,
                            labelStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {});
                              },
                              icon: Image.asset(
                                'assets/images/eye.png',
                                //width: 25,
                                height: 25,
                                color: Colors.black,
                              ),
                            )),
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.check_box,
                                color: 'FF1A237E'.toColor(),
                              ),
                              label: Text(
                                'save_account'.tr,
                                style: const TextStyle(color: Colors.white),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: Text('forgot_password'.tr,
                                  style: TextStyle(color: '#ffffff'.toColor())))
                        ]),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            // color: Colors.green,
                            width: MediaQuery.of(context).size.width - 126,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  backgroundColor: 'FF1A237E'.toColor(),
                                  foregroundColor: Colors.white),
                              child: Text(
                                'login'.tr,
                                style: const TextStyle(fontSize: 18),
                              ),
                              onPressed: () {
                                presenter.handleLogin(
                                    userNameCtrl, passwordController, context);
                              },
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/images/face-id.png',
                              width: 60,
                              height: 60,
                              color: '#ffffff'.toColor(),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "do_you_have_an_account".tr,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                          children: [
                            TextSpan(
                                text: "create_account".tr,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    //Navigator.push(context, SignUpView.route());
                                  })
                          ]),
                    ),
                    Container(
                      height: 75,
                      margin: const EdgeInsets.only(top: 150),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: BottomNavigationBar(
                            fixedColor: Colors.white,
                            type: BottomNavigationBarType.fixed,
                            unselectedItemColor: Colors.white,
                            iconSize: 25,
                            selectedFontSize: 12,
                            unselectedFontSize: 12,
                            backgroundColor: 'FF1A237E'.toColor(),
                            items: <BottomNavigationBarItem>[
                              BottomNavigationBarItem(
                                icon: Image.asset(
                                  'assets/images/chart-up.png',
                                  width: 22,
                                  height: 22,
                                  color: '#ffffff'.toColor(),
                                ),
                                label: "market_info_tab".tr,
                              ),
                              BottomNavigationBarItem(
                                icon: Image.asset(
                                  'assets/images/news.png',
                                  width: 22,
                                  height: 22,
                                  color: '#ffffff'.toColor(),
                                ),
                                label: "notify_news".tr,
                              ),
                              BottomNavigationBarItem(
                                icon: const Icon(Icons.explore),
                                label: "tutorial".tr,
                              ),
                              BottomNavigationBarItem(
                                icon: Image.asset(
                                  'assets/images/telephone.png',
                                  width: 24,
                                  height: 24,
                                  color: '#ffffff'.toColor(),
                                ),
                                label: "contact".tr,
                              ),
                            ],
                            onTap: (index) {
                              setState(() {
                                switch (index) {
                                  case 0:
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const MyHomePage()),
                                    );
                                    break;
                                    
                                }
                              });
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}