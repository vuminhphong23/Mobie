import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qly_ban_hang/models/Interfaces.dart';

class HomeBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(
        builder: (context, ui, child) {
          return Container(
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: ui.appBarColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.pushNamed(context, "homePage"),
                  child: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, "productPage"),
                  child: Icon(
                    Icons.dashboard,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, "orderPage"),
                  child: Icon(
                    CupertinoIcons.cart_fill,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, "settingPage"),
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}
