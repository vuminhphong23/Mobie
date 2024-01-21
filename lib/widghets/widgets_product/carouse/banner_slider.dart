import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'controller.dart';
import 'rounded_image.dart';
import 'slider_round.dart';


class Banner_slider extends StatelessWidget {
   Banner_slider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          CarouselSlider(
              items: const[
                Image_rounded(imgURl: 'images/shoes_banner1.png', width: 360,height: 200),
                Image_rounded(imgURl: 'images/banner2.png',width: 360,height: 200),
                Image_rounded(imgURl: 'images/banner3.png',width: 360,height: 200)

              ],
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index,_) => controller.updatePageIndicator(index)

              )
          ),
          SizedBox(height: 16),
          Center(
            child: Obx(
                ()=> Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for(int i = 0; i < 3; i++) Circular_slider(
                      width: 20,
                      height: 6,
                      backgroundColor: controller.carouseIndex.value == i ? Colors.purple : Colors.black38,
                      margin: EdgeInsets.only(right: 10),

                )
              ],),
            ),
          )
        ],
      ),
    );
  }
}