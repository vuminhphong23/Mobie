import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.showBorder = false,
    this.radius = 16,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.grey, this.margin,

  });

  final double ? width;
  final double ? height;
  final double radius;
  final Widget ? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry ? padding;
  final EdgeInsetsGeometry ? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
