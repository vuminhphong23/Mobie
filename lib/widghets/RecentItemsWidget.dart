import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:qly_ban_hang/localization/locales.dart';

class RecentItemsWidget extends StatefulWidget {
  @override
  _RecentItemsWidgetState createState() => _RecentItemsWidgetState();
}

class _RecentItemsWidgetState extends State<RecentItemsWidget> {
  bool showAll = false;


  @override
  Widget build(BuildContext context) {
    final itemCount = showAll ? 7 : 4;

    return Column(
      children: [
        GridView.count(
          padding: EdgeInsets.all(5),
          crossAxisCount: 1,
          childAspectRatio: 2.6,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            for (int i = 1; i <= itemCount; i++)
              InkWell(
                onTap: () => Navigator.pushNamed(context, 'orderDetail'),
                child: Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F9FD),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF475269).withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              LocaleData.id.getString(context),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              LocaleData.name.getString(context),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              LocaleData.date.getString(context),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),

                      SizedBox(height: 15),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Nike000$i",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF475269),
                              ),
                            ),
                            Text(
                              "Shoe Maker",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF475269),
                              ),
                            ),
                            Text(
                              "20/01/2024",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF475269),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleData.totals.getString(context),
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF475269),
                              ),
                            ),
                            Text(
                              "50\$",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        if (itemCount == 4 || itemCount == 7) // Show buttons only when needed
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      showAll = !showAll;
                    });
                  },
                  child: Text(
                    showAll ? LocaleData.showLess.getString(context) : LocaleData.viewMore.getString(context),
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
