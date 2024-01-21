import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_localization/flutter_localization.dart';
import 'package:qly_ban_hang/localization/locales.dart';
import 'package:qly_ban_hang/widghets/widgets_home/HomeBottomNavBar.dart';
import 'package:qly_ban_hang/widghets/components/MyDrawer.dart';

import '../models/hoadonmodel.dart';
import '../main.dart';
import '../widghets/widgets_home/AutoImageSlider.dart';
import '../widghets/widgets_home/RecentItemsWidget.dart';
import '../widghets/widgets_home/RowItemsWidget.dart';

class HomePage extends StatefulWidget {
  final List<HoaDon> danhSachHoaDon;
  HomePage({required this.danhSachHoaDon});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //APP BAR
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F9FD),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: InkWell(
                            onTap: () => Scaffold.of(context).openDrawer(),
                            child: Icon(
                              Icons.person,
                              size: 30,
                              color: Color(0xFF475269),
                            ),
                          ),
                        );
                      },
                    ),
                    Text(
                      "Shoe Maker",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.purple,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F9FD),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: badges.Badge(
                        badgeContent: Text(
                          "3",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        child: Icon(
                          Icons.notifications,
                          size: 30,
                          color: Color(0xFF475269),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15,),
              AutoImageSlider(),

              SizedBox(height: 30,),

              RowItemsWidget(danhSachHoaDon: danhSachHoaDon),
              SizedBox(height: 20,),
              Container(
                child: Text(LocaleData.recentOrders.getString(context),style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),),
              ),
              RecentItemsWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}
