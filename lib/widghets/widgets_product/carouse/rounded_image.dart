import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Image_rounded extends StatelessWidget {
  const Image_rounded({
    super.key,
    this.border,
    this.padding,
    this.onPressed,
    this.width ,
    this.height ,
    this.applyImageRadius = true,
    required this.imgURl,
    this.fit = BoxFit.fill,
    this.backgroundColor = Colors.white,
    this.isNetworkImage = false,
    this.borderRadius = 16
  });

  final double? width, height;
  final String imgURl;
  final bool applyImageRadius;
  final BoxBorder ? border;
  final Color backgroundColor;
  final BoxFit ? fit;
  final EdgeInsetsGeometry ? padding;
  final bool isNetworkImage;
  final VoidCallback ? onPressed;
  final double borderRadius;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(border: border, color: backgroundColor,borderRadius: BorderRadius.circular(16)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image (
                image: AssetImage (imgURl),
                fit: fit
            ),
          )
      ),
    );
  }
}
