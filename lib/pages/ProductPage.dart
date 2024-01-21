import 'package:flutter/material.dart';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:qly_ban_hang/localization/locales.dart';
import 'package:qly_ban_hang/models/Interfaces.dart';
import 'package:qly_ban_hang/widghets/widgets_product/product_view/product_detail.dart';

import '../widghets/components/MyDrawer.dart';
import '../widghets/widgets_home/HomeBottomNavBar.dart';
import '../widghets/widgets_product/carouse/banner_slider.dart';
import '../widghets/widgets_product/container/search_container.dart';
import '../widghets/widgets_product/product_view/form_add_product.dart';
import '../widghets/widgets_product/product_view/form_edit_product.dart';
import '../widghets/widgets_product/product_view/product.dart';
import '../widghets/widgets_product/product_view/tabBar.dart';

// --------------- 5:50 video 18-----------
class ProductView extends StatefulWidget {
  ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {

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

  final List<Product> allProducts = [];
  late List<Product> _originalProList;
  @override
  void initState() {
    super.initState();
    // Combine both lists into a single list
    allProducts.addAll(sports);
    allProducts.addAll(man);
    _originalProList = List.from(allProducts);
  }

  void _showDeleteConfirmationDialog(Product pd, List<Product> chosen_product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this product?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteProduct(pd,chosen_product);
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
  void _deleteProduct(Product hd,List<Product> chosen_product) {
    setState(() {
      chosen_product.remove(hd);
      allProducts.remove(hd);
    });
    Fluttertoast.showToast(msg: 'Deleted product ${hd.name}');
  }

  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  void searchProduct(String query) {
    setState(() {
      allProducts.clear();
      allProducts.addAll(_originalProList.where((hd) =>
          hd.name.toLowerCase().contains(query.toLowerCase())));
      if (allProducts.isEmpty) {
        isSearching = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(
        builder: (context, ui, child) {
          return DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: new AppBar(
                backgroundColor: ui.appBarColor,
                title: Text(
                  LocaleData.products.getString(context), style: TextStyle(color: Colors.white),),

                actions: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (isSearching) {
                          isSearching = false;
                          allProducts.clear();
                          allProducts.addAll(_originalProList);
                        } else {
                          isSearching = true;
                        }
                      });
                    },
                    icon: Icon(Icons.search, color: Colors.white),
                  ),
                  if (isSearching)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 200.0,
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                              hintText: 'Nhap ten san pham',
                              hintStyle: TextStyle(color: Colors.white)

                          ),
                          onChanged: (value) {
                            searchProduct(value);
                          },
                          onSubmitted: (value) {},
                        ),
                      ),
                    ),
                ],
              ),


              drawer: MyDrawer(),

              body: NestedScrollView(
                headerSliverBuilder: (_, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      pinned: true,
                      floating: true,
                      expandedHeight: 380,

                      flexibleSpace: Padding(
                        padding: EdgeInsets.all(10),
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            SizedBox(height: 16),
                            // SearchContainer(text: '', showBorder: true),
                            SizedBox(height: 16),
                            Banner_slider()

                          ],
                        ),
                      ),
                      // ----------------------------TABBAR-------------------------------
                      bottom: MyTabbar(
                          tabs: [
                            Tab(child: Text(
                                LocaleData.sports.getString(context), style: TextStyle(fontSize: 18))),
                            Tab(child: Text(
                                LocaleData.man.getString(context), style: TextStyle(fontSize: 18))),
                            Tab(child: Text(
                                LocaleData.woman.getString(context), style: TextStyle(fontSize: 18))),
                            Tab(child: Text(
                                LocaleData.newArrival.getString(context), style: TextStyle(fontSize: 18))),
                          ]
                      ),
                    )
                  ];
                },
                //
                body: TabBarView(
                  children: [
                    sports.isEmpty
                        ? Center(child: Text('Your product list is empty'))
                        :
                    Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: sports.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailPage(
                                            name: sports[index].name,
                                            url: sports[index].ImgUrl,
                                            price: sports[index].price,
                                            des: sports[index].des,

                                          ),
                                    ),
                                  );
                                },
                                child: Card(
                                  child: SizedBox(
                                    height: 100,
                                    child: Center(
                                      child: ListTile(
                                        title: Text(
                                          sports[index].name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        leading: SizedBox(
                                          child: Image.asset(sports[index].ImgUrl,
                                            fit: BoxFit.fill,),
                                        ),
                                        trailing: SizedBox(
                                          width: 90,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  final updatedProduct = await Navigator
                                                      .of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditProductPage(
                                                                  product: sports[index])));
                                                  if (updatedProduct != null) {
                                                    setState(() {
                                                      sports[index] =
                                                          updatedProduct;
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      color: Colors.blue,
                                                      borderRadius: BorderRadius
                                                          .circular(10),
                                                    ),
                                                    child: Icon(Icons.edit, size: 20,color: Colors.white,)),
                                              ),

                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    // sports.removeAt(index);
                                                    _showDeleteConfirmationDialog(sports[index], sports);
                                                  });
                                                },
                                                child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius: BorderRadius
                                                          .circular(10),
                                                    ),
                                                    child: Icon(Icons.delete, size: 20,color: Colors.white,)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  elevation: 5,
                                  color: Color(0xFFF5F9FD),
                                  margin: EdgeInsets.all(10),
                                ),
                              );
                            },
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () async {
                            final result = await Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => AddProductPage()));
                            if (result != null) {
                              setState(() {
                                sports.add(result);
                                allProducts.add(result);
                              });
                            }
                          },
                          label: Text(LocaleData.add.getString(context), style: TextStyle(
                              color: Colors.white, fontSize: 20),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          icon: Icon(Icons.add, color: Colors.white,),
                        ),
                      ],
                    ),




                    Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: man.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailPage(
                                            name: new_arr[index].name,
                                            url: new_arr[index].ImgUrl,
                                            price: new_arr[index].price,
                                            des: new_arr[index].des,

                                          ),
                                    ),
                                  );
                                },
                                child: Card(
                                  child: SizedBox(
                                    height: 100,
                                    child: Center(
                                      child: ListTile(
                                        title: Text(man[index].name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        leading: SizedBox(
                                          child: Image.asset(
                                            man[index].ImgUrl, fit: BoxFit.fill,),
                                        ),
                                        trailing: SizedBox(
                                          width: 90,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  final updatedProduct = await Navigator
                                                      .of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditProductPage(
                                                                  product: man[index])));
                                                  if (updatedProduct != null) {
                                                    setState(() {
                                                      man[index] = updatedProduct;
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      color: Colors.blue,
                                                      borderRadius: BorderRadius
                                                          .circular(10),
                                                    ),
                                                    child: Icon(Icons.edit, size: 20,color: Colors.white,)),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _showDeleteConfirmationDialog(man[index], man);
                                                  });
                                                },
                                                child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius: BorderRadius
                                                          .circular(10),
                                                    ),
                                                    child: Icon(Icons.delete, size: 20,color: Colors.white,)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  elevation: 5,
                                  color: Color(0xFFF5F9FD),
                                  margin: EdgeInsets.all(10),
                                ),
                              );
                            },
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () async {
                            final result = await Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => AddProductPage()));
                            if (result != null) {
                              setState(() {
                                man.add(result);
                                allProducts.add(result);
                              });
                            }
                          },
                          label: Text('Add', style: TextStyle(color: Colors
                              .white, fontSize: 20),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          icon: Icon(Icons.add, color: Colors.white,),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: women.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailPage(
                                            name: women[index].name,
                                            url: women[index].ImgUrl,
                                            price: women[index].price,
                                            des: women[index].des,

                                          ),
                                    ),
                                  );
                                },
                                child: Card(
                                  child: SizedBox(
                                    height: 100,
                                    child: Center(
                                      child: ListTile(
                                        title: Text(women[index].name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        leading: SizedBox(
                                          child: Image.asset(women[index].ImgUrl,
                                            fit: BoxFit.fill,),
                                        ),
                                        trailing: SizedBox(
                                          width: 90,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  final updatedProduct = await Navigator
                                                      .of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditProductPage(
                                                                  product: women[index])));
                                                  if (updatedProduct != null) {
                                                    setState(() {
                                                      women[index] =
                                                          updatedProduct;
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      color: Colors.blue,
                                                      borderRadius: BorderRadius
                                                          .circular(10),
                                                    ),
                                                    child: Icon(Icons.edit, size: 20,color: Colors.white,)),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _showDeleteConfirmationDialog(women[index], women);
                                                  });
                                                },
                                                child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius: BorderRadius
                                                          .circular(10),
                                                    ),
                                                    child: Icon(Icons.delete, size: 20,color: Colors.white,)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  elevation: 5,
                                  color: Color(0xFFF5F9FD),
                                  margin: EdgeInsets.all(10),
                                ),
                              );
                            },
                          ),
                        ),

                        ElevatedButton.icon(
                          onPressed: () async {
                            final result = await Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => AddProductPage()));
                            if (result != null) {
                              setState(() {
                                women.add(result);
                                allProducts.add(result);
                              });
                            }
                          },
                          label: Text('Add', style: TextStyle(color: Colors
                              .white, fontSize: 20),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          icon: Icon(Icons.add, color: Colors.white,),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: new_arr.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailPage(
                                            name: new_arr[index].name,
                                            url: new_arr[index].ImgUrl,
                                            price: new_arr[index].price,
                                            des: new_arr[index].des,

                                          ),
                                    ),
                                  );
                                },
                                child: Card(
                                  child: SizedBox(
                                    height: 100,
                                    child: Center(
                                      child: ListTile(
                                        title: Text(new_arr[index].name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        leading: SizedBox(
                                          child: Image.asset(
                                            new_arr[index].ImgUrl,
                                            fit: BoxFit.fill,),
                                        ),
                                        trailing: SizedBox(
                                          width: 90,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  final updatedProduct = await Navigator
                                                      .of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditProductPage(
                                                                  product: new_arr[index])));
                                                  if (updatedProduct != null) {
                                                    setState(() {
                                                      new_arr[index] =
                                                          updatedProduct;
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      color: Colors.blue,
                                                      borderRadius: BorderRadius
                                                          .circular(10),
                                                    ),
                                                    child: Icon(Icons.edit, size: 20,color: Colors.white,)),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _showDeleteConfirmationDialog(new_arr[index], new_arr);
                                                  });
                                                },
                                                child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius: BorderRadius
                                                          .circular(10),
                                                    ),
                                                    child: Icon(Icons.delete, size: 20,color: Colors.white,)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  elevation: 5,
                                  color: Color(0xFFF5F9FD),
                                  margin: EdgeInsets.all(10),
                                ),
                              );
                            },
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () async {
                            final result = await Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => AddProductPage()));
                            if (result != null) {
                              setState(() {
                                new_arr.add(result);
                                allProducts.add(result);
                              });
                            }
                          },
                          label: Text('Add', style: TextStyle(color: Colors.white, fontSize: 20),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          icon: Icon(Icons.add, color: Colors.white,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: HomeBottomNavBar(),
            ),
          );

        }
    );
  }
}


