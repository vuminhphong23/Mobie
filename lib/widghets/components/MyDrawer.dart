import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:qly_ban_hang/localization/locales.dart';
import 'package:qly_ban_hang/models/Interfaces.dart';

import 'SettingItems.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(
        builder: (context, ui, child) {
      return Drawer(

        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
              color: ui.appBarColor,
            ),
              child: Container(
                  child:Row(
                    children: [
                      GestureDetector(
                        child: CircleAvatar(
                          radius: 38,
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.person, color: Colors.white, size: 50),
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Admin',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'shoemaker@gmail.com',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, "homePage"),
                    child: SettingItem(
                      title: LocaleData.home.getString(context),
                      icon: Ionicons.home,
                      bgColor: Colors.purple.shade100,
                      iconColor: Colors.purple,
                      onTap: () => Navigator.pushNamed(context, "homePage"),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, "productPage"),
                    child: SettingItem(
                      title: LocaleData.products.getString(context),
                      icon: Icons.dashboard,
                      bgColor: Colors.blue.shade100,
                      iconColor: Colors.blue,
                      onTap: () => Navigator.pushNamed(context, "productPage"),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, "orderPage"),
                    child: SettingItem(
                      title: LocaleData.orders.getString(context),
                      icon: Ionicons.cart,
                      bgColor: Colors.orange.shade100,
                      iconColor: Colors.orange,
                      onTap: () => Navigator.pushNamed(context, "orderPage"),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, "settingPage"),
                    child: SettingItem(
                      title: LocaleData.settings.getString(context),
                      icon: Ionicons.settings,
                      bgColor: Colors.green.shade100,
                      iconColor: Colors.green,
                      onTap: () => Navigator.pushNamed(context, "settingPage"),
                    ),
                  ),

                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, "/"),
                    child: SettingItem(
                      title: LocaleData.logout.getString(context),
                      icon: Icons.logout,
                      bgColor: Colors.red.shade100,
                      iconColor: Colors.red,
                      onTap: () => Navigator.pushNamed(context, "/"),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      );
     }
    );
  }
}