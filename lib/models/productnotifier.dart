import 'package:flutter/material.dart';
import 'package:qly_ban_hang/widghets/widgets_product/product_view/product.dart';

class ProductNotifier with ChangeNotifier {
  List<Product> _danhSachSanPham = [];

  List<Product> get danhSachSanPham => _danhSachSanPham;

  set danhSachSanPham(List<Product> danhSachSanPham) {
    _danhSachSanPham = danhSachSanPham;
    notifyListeners();
  }
  void addProduct(Product product) {
    _danhSachSanPham.add(product);
    notifyListeners();
  }

  void deleteProduct(Product p) {
    _danhSachSanPham.remove(p);
    notifyListeners();
  }


}