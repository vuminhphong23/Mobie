import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:qly_ban_hang/models/Interfaces.dart';
import 'package:qly_ban_hang/pages/HomePage.dart';
import 'package:qly_ban_hang/pages/LoginPage.dart';


import 'localization/locales.dart';
import 'pages/Orders/quanly_hoadon.dart';
import 'pages/ProductPage.dart';
import 'pages/SettingPage.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserInterface(),
      child: MyApp(),
    ),
  );
}



class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    configureLocalization();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: Provider.of<UserInterface>(context).themeMode,
      routes: {
        "/": (context) => LoginPage(),
        "homePage": (context) => HomePage(),
        "settingPage": (context) => SettingsPage(),
        "productPage": (context) => ProductView(),
        "orderPage": (context) => QuanLyHoaDon(),
        // "orderDetail": (context) => ChiTietHoaDon(),
      },
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
    );
  }
  void configureLocalization(){
    localization.init(mapLocales: LOCALES, initLanguageCode: "en");
    localization.onTranslatedLanguage = onTranslatedLanguage;
  }
  void onTranslatedLanguage(Locale? locale){
    setState(() {

    });
  }
}


