import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> LOCALES = [
  MapLocale("en", LocaleData.EN),
  MapLocale("vi", LocaleData.VI),
  MapLocale("ja", LocaleData.JA),
];
mixin LocaleData{
  static const String settings = 'settings';
  static const String orders = 'orders';
  static const String products = 'products';
  static const String sale = 'sale';
  static const String recentOrders = 'recentOrders';
  static const String id = 'id';
  static const String name = 'name';
  static const String date = 'date';
  static const String totals = 'totals';
  static const String viewMore = 'viewMore';
  static const String showLess = 'showLess';
  static const String darkMode = 'darkMode';
  static const String textDarkMode1 = 'textDarkMode1';
  static const String textDarkMode2 = 'textDarkMode2';
  static const String account = 'account';
  static const String language = 'language';
  static const String notifications = 'notifications';
  static const String colors = 'colors';
  static const String logout = 'logout';
  static const String reset = 'reset';
  static const String home = 'home';

  static const Map<String, dynamic> EN = {
    settings: 'Settings',
    orders: 'Orders',
    products: 'Products',
    sale: 'Sale',
    recentOrders: 'Recent Orders',
    id: 'ID',
    name:'NAME',
    date:'DATE',
    totals:'Totals',
    viewMore:'View More',
    showLess:'Show Less',
    darkMode:'Dark Mode',
    textDarkMode1: 'On',
    textDarkMode2: 'Off',
    account: 'Account',
    language: 'Language',
    notifications: 'Notifications',
    colors: 'Colors',
    logout: 'Log Out',
    reset: 'Reset',
    home: 'Home',
  };

  static const Map<String, dynamic> VI = {
    settings: 'Cài đặt',
    orders: 'Đơn hàng',
    products: 'Sản phẩm',
    sale: 'Doanh thu',
    recentOrders: 'Đơn hàng gần đây',
    id: 'MÃ',
    name:'TÊN',
    date:'NGÀY',
    totals:'Tổng',
    viewMore:'Xem thêm',
    showLess:'Thu gọn',
    darkMode:'Chế độ tối',
    textDarkMode1: 'Bật',
    textDarkMode2: 'Tắt',
    account: 'Tài khoản',
    language: 'Ngôn ngữ',
    notifications: 'Thông báo',
    colors: 'Màu sắc',
    logout: 'Đăng xuất',
    reset: 'Cài lại',
    home: 'Trang chủ',


  };

  static const Map<String, dynamic> JA = {
    settings: '設定',
    orders: '注文',
    products: '製品',
    sale: 'セール',
    recentOrders:'最近の注文',
    id:'身元',
    name:'名前',
    date:'日付',
    totals:'合計',
    viewMore:'もっと見る',
    showLess:'表示を減らす',
    darkMode:'ダークモード',
    textDarkMode1: 'の上',
    textDarkMode2: 'オフ',
    account: 'アカウント',
    language: '言語',
    notifications: '通知',
    colors: '色',
    logout: 'ログアウト',
    reset: 'リセット',
    home: '家',

  };

}
