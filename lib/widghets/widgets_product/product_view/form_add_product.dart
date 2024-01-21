import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qly_ban_hang/localization/locales.dart';
import 'package:qly_ban_hang/models/Interfaces.dart';

import 'product.dart';


class AddProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(
        builder: (context,ui,child){
          return  Scaffold(
            appBar: AppBar(
              backgroundColor: ui.appBarColor,
              title: Text(LocaleData.addProduct.getString(context),style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white,
              ),),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ProductForm(),
            ),
          );
        }

    );
  }
}

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _productNameController = TextEditingController();
  final _productImgController = TextEditingController();
  final _productPriceController = TextEditingController();
  final _productDesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _productNameController,
          decoration: InputDecoration(labelText: LocaleData.productName.getString(context)),
        ),
        SizedBox(height: 16.0),
        TextField(
          controller: _productImgController,
          decoration: InputDecoration(labelText: LocaleData.productURL.getString(context)),
          // keyboardType: TextInputType.number,
        ),
        TextField(
          controller: _productPriceController,
          decoration: InputDecoration(labelText: 'Product Price'),
          // keyboardType: TextInputType.number,
        ),
        TextField(
          controller: _productDesController,
          decoration: InputDecoration(labelText: 'Product Description'),
          // keyboardType: TextInputType.number,
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            String productName = _productNameController.text;
            String productImg= (_productImgController.text);
            String productPrice = (_productPriceController.text);
            String productDes = _productDesController.text;


            // Check if both name and price are not empty before returning
            if (productName.isNotEmpty && productImg.isNotEmpty) {
              // Return the product to the previous screen
              Navigator.pop(
                context,
                Product(name: productName, ImgUrl: productImg, des: productDes, price: productPrice),
              );
            }
          },
          child: Text(LocaleData.save.getString(context)),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _productImgController.dispose();
    super.dispose();
  }
}