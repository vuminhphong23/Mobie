import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../localization/locales.dart';

class RowItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for(int i = 1; i< 4;i++)
            InkWell(
              onTap: (){
                if(i==1){
                  Navigator.pushNamed(context, 'orderPage');
                }
                else if(i==2){
                  Navigator.pushNamed(context, 'productPage');
                }
              },
              child: Container(
                margin: EdgeInsets.only(top:10, bottom: 10, left: 30, right: 30),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 180,

                decoration: BoxDecoration(
                  color: Color(0xFFF5F9FD),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF475269).withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ]
                ),
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 60, right: 60),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFFF475269),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Image.asset("images/$i.png",
                          height: 130,
                          width: 160,
                          fit: BoxFit.contain,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (i == 1) ...[
                            Text(
                              LocaleData.orders.getString(context),
                              style: TextStyle(
                                color: Color(0xFF475269),
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Shoe Maker",
                              style: TextStyle(
                                color: Color(0xFF475269).withOpacity(0.8),
                                fontSize: 16,
                              ),
                            ),
                          ] else if (i == 2) ...[
                            Text(
                              LocaleData.products.getString(context),
                              style: TextStyle(
                                color: Color(0xFF475269),
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Shoe Maker",
                              style: TextStyle(
                                color: Color(0xFF475269).withOpacity(0.8),
                                fontSize: 16,
                              ),
                            ),
                          ] else if (i == 3) ...[
                            Text(
                              LocaleData.sale.getString(context),
                              style: TextStyle(
                                color: Color(0xFF475269),
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Shoe Maker",
                              style: TextStyle(
                                color: Color(0xFF475269).withOpacity(0.8),
                                fontSize: 16,
                              ),
                            ),
                          ],
                          Spacer(),
                          if(i == 1) ...[
                            Row(
                              children: [
                                Text(
                                  "20",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 70,),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF475269),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    CupertinoIcons.plus,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                          ]
                          else if(i == 2) ...[
                            Row(
                              children: [
                                Text(
                                  "30",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 70,),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF475269),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    CupertinoIcons.plus,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                          ]
                          else if(i == 3) ...[
                            Row(
                              children: [
                                Text(
                                  "500.000\$",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ]
                        ],
                      ),
                    ),


                  ],
                ),

              ),
            ),
        ],
      ),
    );
  }
}
