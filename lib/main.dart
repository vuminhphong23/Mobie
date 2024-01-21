import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:qly_ban_hang/models/Interfaces.dart';
import 'package:qly_ban_hang/models/productnotifier.dart';
import 'package:qly_ban_hang/pages/HomePage.dart';
import 'package:qly_ban_hang/pages/LoginPage.dart';


import 'localization/locales.dart';
import 'models/hoadonmodel.dart';
import 'models/ordernotifier.dart';
import 'pages/Orders/quanly_hoadon.dart';
import 'pages/ProductPage.dart';
import 'pages/SettingPage.dart';
import 'widghets/widgets_product/product_view/product.dart';


final List<HoaDon> danhSachHoaDon = [
  HoaDon(
    maHD : "Nike01",
    tongTien : "\$100",
    ngayBan : DateTime(2024, 1, 17),
    name : "Shoe Maker",
  ),
  HoaDon(
    maHD : "Nike02",
    tongTien : "\$120",
    ngayBan : DateTime(2024, 1, 18),
    name : "Shoe Maker",
  ),
  HoaDon(
    maHD : "Nike03",
    tongTien : "\$150",
    ngayBan : DateTime(2024, 1, 19),
    name : "Shoe Maker",
  ),
  HoaDon(
    maHD : "Nike04",
    tongTien : "\$200",
    ngayBan : DateTime(2024, 1, 20),
    name : "Shoe Maker",
  ),
  HoaDon(
    maHD : "Nike05",
    tongTien : "\$250",
    ngayBan : DateTime(2024, 1, 21),
    name : "Shoe Maker",
  ),
];

List<Product> sports = [
  Product(name: 'Sport 1', ImgUrl: 'images/product3.png', price: "\$100", des: 'This is description'),
  Product(name: 'Sport 2', ImgUrl: 'images/product1.png', price: "\$100", des: 'This is description'),
  Product(name: 'Sport 3', ImgUrl: 'images/product2.png', price: "\$100", des: 'This is description'),
];

List<Product> man = [
  Product(name: 'Men 1', ImgUrl: 'images/men1.png',price: "\$100", des: 'This is description'),
  Product(name: 'Men 2', ImgUrl: 'images/men2.png',price: "\$100", des: 'This is description'),
  Product(name: 'Men 3', ImgUrl: 'images/men3.png',price: "\$100", des: 'This is description'),
  Product(name: 'Men 4', ImgUrl: 'images/men4.png',price: "\$100", des: 'This is description'),
];

List<Product> women = [
  Product(name: 'Women 1', ImgUrl: 'images/woman1.png',price: "\$100", des: 'This is description'),
  Product(name: 'Women 2', ImgUrl: 'images/woman2.png',price: "\$100", des: 'This is description'),
  Product(name: 'Women 3', ImgUrl: 'images/woman3.png',price: "\$100", des: 'This is description'),
  Product(name: 'Women 4', ImgUrl: 'images/woman4.png',price: "\$100", des: 'This is description'),
  Product(name: 'Women 5', ImgUrl: 'images/woman5.png',price: "\$100", des: 'This is description'),
];

List<Product> new_arr = [
  Product(name: 'New 1', ImgUrl: 'images/new1.png',price: "\$100", des: 'This is description'),
  Product(name: 'New 2', ImgUrl: 'images/new2.png',price: "\$100", des: 'This is description'),
  Product(name: 'New 3', ImgUrl: 'images/new3.png',price: "\$100", des: 'This is description'),
  Product(name: 'New 4', ImgUrl: 'images/new4.png',price: "\$100", des: 'This is description'),
];
final List<Product> danhSachSanPham = sports + man + women + new_arr;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserInterface()),
        ChangeNotifierProvider(create: (context) {
          final notifier = OrderNotifier();
          notifier.danhSachHoaDon = danhSachHoaDon;
          return notifier;
        }),
        ChangeNotifierProvider(create: (context) {
          final notifier = ProductNotifier();
          notifier.danhSachSanPham = danhSachSanPham;
          return notifier;
        }),
      ],
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
        "homePage": (context) => HomePage(danhSachHoaDon: danhSachHoaDon),
        "settingPage": (context) => SettingsPage(),
        "productPage": (context) => ProductView(),
        "orderPage": (context) => QuanLyHoaDon(danhSachHoaDon: danhSachHoaDon),
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


