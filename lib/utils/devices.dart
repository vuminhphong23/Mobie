import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class DeviceUtils {

  static void hideKeyboard (BuildContext context){
    FocusScope.of(context).requestFocus(FocusNode());
  }
  
  static double getScreenHeight(){
    return MediaQuery.of(Get.context!).size.height;
  }

  static double getScreenWidth (BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static double getAppBarHeight(){
    return kToolbarHeight;
  }
}