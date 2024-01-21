import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:qly_ban_hang/models/Interfaces.dart';

import '../../../localization/locales.dart';
import 'product.dart';


class EditProductPage extends StatefulWidget {
  final Product product;

  EditProductPage({required this.product});

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  late TextEditingController nameController;
  late TextEditingController urlController;
  late TextEditingController productPriceController;
  late TextEditingController productDesController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with existing product data
    nameController = TextEditingController(text: widget.product.name);
    urlController = TextEditingController(text: widget.product.ImgUrl);
    productPriceController = TextEditingController(text: widget.product.price );
    productDesController = TextEditingController(text:  widget.product.des);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(
        builder: (context, ui, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ui.appBarColor,
              title: Text(LocaleData.editProduct.getString(context), style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 28,color: Colors.white,
              ),),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: LocaleData.productName.getString(context)),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: urlController,
                    decoration: InputDecoration(labelText: LocaleData.productURL.getString(context)),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: productPriceController,
                    decoration: InputDecoration(labelText: 'Product Price'),
                  ),
                  SizedBox(height: 10),

                  TextField(
                    controller: productDesController,
                    decoration: InputDecoration(labelText: 'Product Description'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Update the product data and pop the current page
                      final updatedProduct = Product(
                        name: nameController.text,
                        ImgUrl: urlController.text,
                        price: productPriceController.text,
                        des: productDesController.text,
                      );

                      // Return the updated product to the previous page
                      Navigator.pop(context, updatedProduct);
                    },
                    child: Text(LocaleData.save.getString(context)),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}