import 'dart:ffi';

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
  static const String sports = 'sports';
  static const String man = 'man';
  static const String woman = 'woman';
  static const String newArrival = 'newArrival';
  static const String add = 'add';
  static const String search = 'search';
  static const String productName = 'productName';
  static const String productURL = 'productURL';
  static const String productPrice = 'productPrice';
  static const String productDes = 'productDescription';
  static const String save = 'save';
  static const String addProduct = 'addProduct';
  static const String editProduct = 'editProduct';
  static const String orderDetail = 'orderDetail';
  static const String selectedItem = 'selectedItem';
  static const String totalCost = 'totalCost';
  static const String deliveryCost = 'deliveryCost';
  static const String totalPayment = 'totalPayment';
  static const String voucher = 'voucher';









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
    sports: 'Sports',
    man: 'Man',
    woman: 'Woman',
    newArrival: 'New arrival',
    add: 'Add',
    search: 'Search',
    addProduct: 'Add Product',
    productName: 'Product Name',
    productURL: 'Product Url',
    save: 'Save',
    editProduct: 'Edit Product',
    orderDetail: 'Order Details',
    selectedItem: 'Selected Items',
    totalCost: 'Total cost',
    deliveryCost: 'Delivery cost',
    totalPayment: 'Total payment',
    voucher: 'Voucher',
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
    sports: 'Thể thao',
    man: 'Nam',
    woman: 'Nữ',
    newArrival: 'Mới về',
    add: 'Thêm',
    search: 'Tìm kiếm',
    addProduct: 'Thêm sản phẩm',
    productName: 'Tên sản phẩm',
    productURL: 'Url sản phẩm',
    save: 'Lưu',
    editProduct: 'Sửa sản phẩm',
    orderDetail: 'Chi tiết đơn hàng',
    selectedItem: 'Tìm sản phẩm',
    totalCost: 'Tổng tiền',
    deliveryCost: 'Phí giao hàng',
    totalPayment: 'Tổng thanh toán',
    voucher: 'Mã giảm giá',
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
    sports: 'スポーツ',
    man: '男',
    woman: '女性',
    newArrival: '新参者',
    add: '追加',
    search: '検索',
    addProduct: '製品の追加',
    productName: '商品名',
    productURL: '製品URL',
    save: '保存',
    editProduct: '製品の編集',
    orderDetail: '注文詳細',
    selectedItem: '選択されたアイテム',
    totalCost: '総費用',
    deliveryCost: '配送料',
    totalPayment: 'お支払い総額',
    voucher: 'バウチャー',
  };

}
