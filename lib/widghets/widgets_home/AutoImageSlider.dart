import 'dart:async';
import 'package:flutter/material.dart';

class AutoImageSlider extends StatefulWidget {
  @override
  _AutoImageSliderState createState() => _AutoImageSliderState();
}

class _AutoImageSliderState extends State<AutoImageSlider> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  List<String> images = ["images/logo.png", "images/logo1.png", "images/logo2.png", "images/logo3.png", "images/logo4.png"];
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  _startAutoSlide() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 390,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: PageView.builder(
        controller: _pageController,
        itemCount: images.length,
        onPageChanged: (index) {
          _currentPage = index;
        },
        itemBuilder: (context, index) {
          return Image.asset(
            images[index],
            fit: BoxFit.fill,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }
}
