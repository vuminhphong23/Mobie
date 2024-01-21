import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:qly_ban_hang/models/Interfaces.dart';

import '../../localization/locales.dart';
import '../../widghets/widgets_home/HomeBottomNavBar.dart';

class ChiTietHoaDon  extends StatelessWidget {

  final String maHD;
  final String tongTien;
  final DateTime ngayBan;
  final String name;

  ChiTietHoaDon({
    required this.maHD,
    required this.tongTien,
    required this.ngayBan,
    required this.name,
  });

  double parseAmount(String amountString) {
    amountString = amountString.replaceAll('\$', '');
    return double.parse(amountString);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(
        builder: (context, ui, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                LocaleData.orderDetail.getString(context),
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: ui.appBarColor,
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: Colors.white),
                )
              ],
            ),

            body: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.shopping_cart),
                          SizedBox(width: 8.0),
                          Text(LocaleData.selectedItem.getString(context)),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Divider(),
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.network(
                              'https://lh3.googleusercontent.com/6euB1qM538WNYNFPEl1w1sNM00sTlgr0KBRqk_CeOlMFGOqq2yEBqe49HIldpfv8oVypbiwsdoQ6VMUsamiyGr_JibvyKUon85vMJtAxihuOC80xF_6le7hsx3ptiYce1N5pEGDCRNDL9I2X4kZ5AXY',
                              width: 100.0,
                              height: 100.0,
                              fit: BoxFit.cover,
                            ),
                          ),

                          SizedBox(width: 16.0),

                          Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Men Shoes - Sport Shoes',
                                        style: TextStyle(fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 40.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Text(
                                        LocaleData.totals.getString(context) +
                                            ': 100\$',
                                        style: TextStyle(fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'x2',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ],
                                  )
                                ],
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.network(
                              'https://topdanhgiaaz.com/wp-content/uploads/2021/05/anh1-1.jpg',
                              width: 100.0,
                              height: 100.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Men Shoes - Sport Shoes',
                                        style: TextStyle(fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 40.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Text(
                                        LocaleData.totals.getString(context) +
                                            ': 100\$',
                                        style: TextStyle(fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'x1',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ],
                                  )
                                ],
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Row 2
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.network(
                              'https://censor.vn/wp-content/uploads/2022/02/cac-mau-giay-nike-2-1085x800.jpg',
                              width: 100.0,
                              height: 100.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Men Shoes - Sport Shoes',
                                        style: TextStyle(fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 40.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Text(
                                        LocaleData.totals.getString(context) +
                                            ': 100\$',
                                        style: TextStyle(fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'x1',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ],
                                  )
                                ],
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(LocaleData.totalCost.getString(context)),
                              Text(LocaleData.deliveryCost.getString(context))
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('$tongTien'),
                              Text('\$10'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LocaleData.totalPayment.getString(context),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$${(parseAmount(tongTien) + parseAmount('10.0'))
                                .toStringAsFixed(2)}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.local_offer,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 8.0),
                      Text(LocaleData.voucher.getString(context)),
                      SizedBox(width: 24.0),

                      Container(
                        height: 24.0,
                        width: 1.0,
                        color: Colors.grey,
                      ),

                      SizedBox(width: 8.0),

                      Expanded(
                        child: Text(
                          '.............',
                          style: TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation
                .centerFloat,
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.check),
              onPressed: () {},
            ),
            bottomNavigationBar: HomeBottomNavBar(),
          );
        }
    );
  }
}