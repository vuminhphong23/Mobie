import 'package:flutter/material.dart';

import '../../../utils/devices.dart';


class MyTabbar extends StatelessWidget implements PreferredSizeWidget{
  const MyTabbar({
    super.key, required this.tabs
  });

  final List<Widget>tabs;
  @override
  Widget build(BuildContext context) {
    return Material(

      child: TabBar(
        isScrollable: true,
        indicatorColor: Colors.purple,
        unselectedLabelColor: Colors.red, 
        tabs: tabs,
        
      )
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());
}
