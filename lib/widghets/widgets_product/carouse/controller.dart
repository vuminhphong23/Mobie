
import 'package:get/get.dart';

class HomeController extends GetxController{
  static HomeController get instance => Get.find();

  final carouseIndex = 0.obs;

  void updatePageIndicator (index){
    carouseIndex.value = index;
  }
}