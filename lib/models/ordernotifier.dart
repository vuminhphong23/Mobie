import 'package:flutter/material.dart';

import '../widghets/widgets_product/product_view/product.dart';
import 'hoadonmodel.dart';

class OrderNotifier with ChangeNotifier {
  List<HoaDon> _danhSachHoaDon = [];

  List<HoaDon> get danhSachHoaDon => _danhSachHoaDon;

  set danhSachHoaDon(List<HoaDon> danhSachHoaDon) {
    _danhSachHoaDon = danhSachHoaDon;
    notifyListeners();
  }



}
