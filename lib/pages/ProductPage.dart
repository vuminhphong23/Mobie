import 'package:flutter/material.dart';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:qly_ban_hang/localization/locales.dart';
import 'package:qly_ban_hang/models/Interfaces.dart';

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
  // static List<String> sports_name = ['Sport 0', 'Sport 1','Sport 3','Sport 04'];
  // static List sport_url = ['assets/images/product1.png','assets/images/product1.png','assets/images/product1.png','assets/images/product1.png'];
  // static List<double> sport_price = [10.0, 11.0,12.2,13.2];

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {

  List<Product> sports = [
    Product(name: 'Sport 1', ImgUrl: 'images/product3.png'),
    Product(name: 'Sport 2', ImgUrl: 'images/product1.png'),
    Product(name: 'Sport 3', ImgUrl: 'images/product2.png'),
  ];

  List<Product> man = [
    Product(name: 'Men 1', ImgUrl: 'images/men1.png'),
    Product(name: 'Men 2', ImgUrl: 'images/men2.png'),
    Product(name: 'Men 3', ImgUrl: 'images/men3.png'),
    Product(name: 'Men 4', ImgUrl: 'images/men4.png'),
  ];

  List<Product> women = [
    Product(name: 'Women 1', ImgUrl: 'images/woman1.png'),
    Product(name: 'Women 2', ImgUrl: 'images/woman2.png'),
    Product(name: 'Women 3', ImgUrl: 'images/woman3.png'),
    Product(name: 'Women 4', ImgUrl: 'images/woman4.png'),
    Product(name: 'Women 5', ImgUrl: 'images/woman5.png'),
  ];

  List<Product> new_arr = [
    Product(name: 'New 1', ImgUrl: 'images/new1.png'),
    Product(name: 'New 2', ImgUrl: 'images/new2.png'),
    Product(name: 'New 3', ImgUrl: 'images/new3.png'),
    Product(name: 'New 4', ImgUrl: 'images/new4.png'),
  ];


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
              ),

              // floatingActionButton: FloatingActionButton(
              //   onPressed: () async{
              //     final result = await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddProductPage()));
              //     if(result != null){
              //       setState(() {
              //         sports.add(result);
              //       });
              //     }
              //   },
              //   child: Icon(Icons.add),
              //   // backgroundColor: Theme.of(context).primaryColorDark,
              // ),


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
                            SearchContainer(text: '', showBorder: true),
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
                              return Container(
                                child: SizedBox(
                                  height: 100,
                                  child: Center(
                                    child: ListTile(
                                      title: Text(sports[index].name),
                                      leading: SizedBox(
                                        child: Image.asset(sports[index].ImgUrl,
                                          fit: BoxFit.fill,),
                                      ),
                                      trailing: SizedBox(
                                        width: 70,
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
                                              child: Icon(Icons.edit),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  sports.removeAt(index);
                                                });
                                              },
                                              child: Icon(Icons.delete),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // elevation: 5,
                                // margin: EdgeInsets.all(10),
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
                              return Container(
                                child: SizedBox(
                                  height: 100,
                                  child: Center(
                                    child: ListTile(
                                      title: Text(man[index].name),
                                      leading: SizedBox(
                                        child: Image.asset(
                                          man[index].ImgUrl, fit: BoxFit.fill,),
                                      ),
                                      trailing: SizedBox(
                                        width: 70,
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
                                              child: Icon(Icons.edit),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  man.removeAt(index);
                                                });
                                              },
                                              child: Icon(Icons.delete),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // elevation: 5,
                                // margin: EdgeInsets.all(10),
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
                              return Container(
                                child: SizedBox(
                                  height: 100,
                                  child: Center(
                                    child: ListTile(
                                      title: Text(women[index].name),
                                      leading: SizedBox(
                                        child: Image.asset(women[index].ImgUrl,
                                          fit: BoxFit.fill,),
                                      ),
                                      trailing: SizedBox(
                                        width: 70,
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
                                              child: Icon(Icons.edit),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  women.removeAt(index);
                                                });
                                              },
                                              child: Icon(Icons.delete),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // elevation: 5,
                                // margin: EdgeInsets.all(10),
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
                              return Container(
                                child: SizedBox(
                                  height: 100,
                                  child: Center(
                                    child: ListTile(
                                      title: Text(new_arr[index].name),
                                      leading: SizedBox(
                                        child: Image.asset(
                                          new_arr[index].ImgUrl,
                                          fit: BoxFit.fill,),
                                      ),
                                      trailing: SizedBox(
                                        width: 70,
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
                                              child: Icon(Icons.edit),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  new_arr.removeAt(index);
                                                });
                                              },
                                              child: Icon(Icons.delete),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // elevation: 5,
                                // margin: EdgeInsets.all(10),
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


